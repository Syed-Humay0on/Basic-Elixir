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

  def pipe_anon do
    ["apple", "banana", "cherry", "date"]
    # length ke hisaab se descending
    |> Enum.sort_by(&String.length/1, :desc)
    # capture syntax (&)
    |> Enum.map(&(&1 <> " is tasty!"))
    |> Enum.join(" | ")
  end

  def process_data(data) do
    data
    # debug print (Elixir 1.12+)
    |> tap(&IO.inspect(&1, label: "raw"))
    |> String.trim()
    |> tap(&IO.inspect(&1, label: "trimmed"))
    |> String.upcase()
    |> tap(&IO.inspect(&1, label: "final"))
  end
end
