defmodule DockerizedSolutions do
  @base_uri "https://hackattic.com/challenges/dockerized_solutions/"
  @request_uri "problem?access_token=#{Application.compile_env(:dockerized_solutions, :token, "test")}"
  @response_uri "solve?access_token=#{Application.compile_env(:dockerized_solutions, :token, "test")}"
  @registry_host "c061-111-65-69-19.ap.ngrok.io"

  defp generate_auth_file({user, pass}) do
    {result, _} =
      System.cmd("docker", [
        "exec",
        "registry-registry-1",
        "htpasswd",
        "-Bnb",
        "#{user}",
        "#{pass}"
      ])

    :ok = File.write("./auth/registry.htpasswd", "\n#{String.trim(result)}", [:append])
  end

  defp remove_stale_repo(_), do: System.cmd("make", ["clean"])

  defp execute_image(image_tag, ignition_key) do
    System.cmd("docker", [
      "pull",
      "#{@registry_host}/hack:#{image_tag}"
    ])

    {result, _} =
      System.cmd("docker", [
        "run",
        "-e",
        "IGNITION_KEY=#{ignition_key}",
        "-t",
        "#{@registry_host}/hack:#{image_tag}"
      ])

    String.trim(result)
  end

  defp obtain_secret([first_tag, second_tag], ignition_key) do
    first_secret = execute_image(first_tag, ignition_key)

    if String.contains?(first_secret, "oops") do
      second_secret = execute_image(second_tag, ignition_key)
      second_secret
    else
      first_secret
    end
  end

  def generate do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")

    %{
      "credentials" => %{"user" => user, "password" => pass},
      "ignition_key" => ignition_key,
      "trigger_token" => trigger_token
    } = response.body

    {user, pass}
    |> generate_auth_file()
    |> remove_stale_repo()

    IO.puts(user)
    IO.puts(pass)

    response =
      Req.post!("https://hackattic.com/_/push/#{trigger_token}",
        json: %{registry_host: @registry_host},
        receive_timeout: 120_000,
        pool_timeout: 120_000
      )

    if response.status == 200 do
      tag_response = Req.get!("https://#{@registry_host}/v2/hack/tags/list", auth: {user, pass})
      result = obtain_secret(tag_response.body["tags"], ignition_key)
      token_response = Req.post!("#{@base_uri}#{@response_uri}", json: %{secret: result})

      if token_response.status == 200 and !Map.has_key?(token_response.body, "rejected") do
        IO.puts("Solution accepted")
      else
        IO.puts("Solution not accepted")
      end

      IO.inspect(token_response)
    end
  end
end

DockerizedSolutions.generate()
