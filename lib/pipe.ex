defmodule PipeOperator do
  def name() do
    "syed humayun aziz"
    |> String.split()
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")

    # → "Syed Humayun Az3" 
  end
end
IO.puts PipeOperator.name()
