defmodule BackupRestore do
  alias NimbleCSV.RFC4180, as: CSV

  @base_uri "https://hackattic.com/challenges/backup_restore/"
  @request_uri "problem?access_token=972b50c2c093c1f8"
  @response_uri "solve?access_token=972b50c2c093c1f8"

  def restore do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")
    {:ok, bytes} = response.body |> Map.get("dump") |> Base.decode64()

    gzip_bytes = :zlib.gunzip(bytes)

    # Save to disk
    File.write("data.sql", gzip_bytes)

    # Load data
    System.cmd("psql", [
      "-h",
      "0.0.0.0",
      "-U",
      "postgres",
      "-d",
      "postgres",
      "-f",
      "data.sql"
    ])

    IO.puts("Loading complete")

    {result, _} =
      System.cmd("psql", [
        "-h",
        "0.0.0.0",
        "-U",
        "postgres",
        "-d",
        "postgres",
        "-c",
        "SELECT ssn from public.criminal_records where status='alive';",
        "--csv"
      ])

    records = result |> CSV.parse_string() |> List.flatten()

    response = Req.post!("#{@base_uri}#{@response_uri}", json: %{alive_ssns: records})

    if response.status == 200 do
      IO.puts("Solution accepted")
    else
      IO.puts("Solution not accepted")
    end
  end
end

BackupRestore.restore()
