defmodule StandardTest do
  use ExUnit.Case
  doctest Standard

  test "greets the world" do
    assert Standard.hello() == :world
  end
end
