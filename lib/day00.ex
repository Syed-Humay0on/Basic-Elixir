# day00.ex
# Run: elixir day02.ex

defmodule Day00 do
  def get_field(map, key) do
    Map.get(map, key, "Not found")
  end
end

# Test it
org = %{"name" => "Humayoon", "Occupation" => "Nadra"}
IO.puts(Day00.get_field(org, "Occupation"))
