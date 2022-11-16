defmodule MiniMiner do
  @base_uri "https://hackattic.com/challenges/mini_miner/"
  @request_uri "problem?access_token=972b50c2c093c1f8"
  @response_uri "solve?access_token=972b50c2c093c1f8"

  def parse do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")
    %{"difficulty" => difficulty, "block" => block} = response.body
    max_val = (:math.pow(2, difficulty) + 1) |> round()

    Enum.each(1..max_val, fn nonce ->
      cur_block = %{block | "nonce" => nonce}
      {:ok, encoded} = Jason.encode(cur_block)
      hash = :crypto.hash(:sha256, encoded |> String.trim())
      <<result::size(difficulty), _rest::bitstring>> = hash

      try do
        if result == 0 do
          response = Req.post!("#{@base_uri}#{@response_uri}", json: %{nonce: nonce})

          if response.status == 200 do
            IO.puts("Solution accepted")
            throw(:break)
          else
            IO.puts("Solution not accepted")
            throw(:break)
          end
        end
      catch
        :break -> :ok
      end
    end)
  end
end

MiniMiner.parse()
