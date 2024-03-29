defmodule PasswordHashing do
  @base_uri "https://hackattic.com/challenges/password_hashing/"
  @request_uri "problem?access_token=972b50c2c093c1f8"
  @response_uri "solve?access_token=972b50c2c093c1f8"

  def generate_hash do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")

    %{
      "password" => password,
      "pbkdf2" => %{"hash" => hash, "rounds" => rounds},
      "salt" => salt,
      "scrypt" => %{
        "N" => n,
        "_control" => _control,
        "buflen" => buflen,
        "p" => p,
        "r" => r
      }
    } = response.body

    {:ok, salt_bytes} = Base.decode64(salt)

    sha = :sha256 |> :crypto.hash(password) |> Base.encode16() |> String.downcase()

    pbkdf2 =
      password
      |> Pbkdf2.Base.hash_password(salt_bytes,
        rounds: rounds,
        digest: String.to_atom(hash),
        format: :hex
      )
      |> String.downcase()

    hmac =
      :hmac |> :crypto.mac(:sha256, salt_bytes, password) |> Base.encode16() |> String.downcase()

    scrypt =
      password
      |> Scrypt.hash(salt_bytes, n |> :math.log2() |> round(), r, p, buflen)
      |> Base.encode16()
      |> String.downcase()

    response =
      Req.post!("#{@base_uri}#{@response_uri}",
        json: %{sha256: sha, hmac: hmac, pbkdf2: pbkdf2, scrypt: scrypt}
      )

    if response.status == 200 do
      IO.puts("Solution accepted")
    else
      IO.puts("Solution not accepted")
    end
  end
end

PasswordHashing.generate_hash()
