defmodule Day1 do
 def greet(:male, name), do: "Mr. #{name}"
 def greet(:female, name), do: "Mrs. #{name}"
 def greet(_, name), do: name 

#DataType Demonstration
def data_types do
IO.puts("Integer: #{42}")
IO.puts("Float: #{3.14}")
IO.puts("String: #{"Elixir"}")
IO.puts("Atom: #{:ok}")
IO.puts("List: #{inspect([1,2,3])}")
IO.puts("Tuple: #{inspect ({:ok, "data"})}")
IO.puts("Map: #{inspect(%{key: "value"})}")
end
end
# Run with: elixir lib/day1.ex
Day1.data_types()
IO.puts(Day1.greet(:male, "Alex"))
