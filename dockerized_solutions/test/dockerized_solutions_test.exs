defmodule DockerizedSolutionsTest do
  use ExUnit.Case
  doctest DockerizedSolutions

  test "greets the world" do
    assert DockerizedSolutions.hello() == :world
  end
end
