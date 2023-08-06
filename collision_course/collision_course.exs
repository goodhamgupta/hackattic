defmodule CollisionCourse do
  @base_uri "https://hackattic.com/challenges/collision_course/"
  @request_uri "problem?access_token=#{Application.compile_env(:collision_course, :token, "test")}"
  @response_uri "solve?access_token=#{Application.compile_env(:collision_course, :token, "test")}"

  def parse do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")
    token = response.body["include"]
    File.write!("input.txt", token)
    System.cmd("bash", ["fast_collider.sh", "input.txt"])

    if File.exists?("msg1.bin") do
      {:ok, fc} = File.read("./msg1.bin")
      {:ok, sc} = File.read("./msg2.bin")

      {:ok, response} =
        Req.post("#{@base_uri}#{@response_uri}",
          json: %{files: [fc |> Base.encode64(), sc |> Base.encode64()]}
        )

      if response.status == 200 do
        IO.puts("Solution accepted")
      else
        IO.puts("Solution not accepted")
      end

      IO.inspect(response)
    end
  end
end

CollisionCourse.parse()
