defmodule IO_Device do
  def input do
    IO.gets("What is your name?\n")
    |> String.trim()
    |> String.split()
    |> Enum.join()
  end

  def capitalize do
    IO.gets("Let's capitalize on this shit\n")
    |> String.capitalize()
  end

  def checker() do
    " hello   WORLD! 123   "
    # dispatch leading/trailing spaces
    |> String.trim()
    # lowercase
    |> String.downcase()
    # remove numbers (regex)
    |> String.replace(~r/\d+/, "")
    # replace ! with ?
    |> String.replace("!", "?")
    # First letter capitalize
    |> String.capitalize()
  end

  def enum() do
    1..20
    # multiples of 3
    |> Enum.filter(fn x -> rem(x, 3) == 0 end)
    # square karo
    |> Enum.map(&(&1 * &1))
    # pehle 5 hi lo
    |> Enum.take(5)
    |> Enum.sum()
  end
end
