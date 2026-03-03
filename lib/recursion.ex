defmodule Math do
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head * accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end

  # 1. BASE CASE: Agar list khaali hai, toh sum 0 hai. (Break lag gayi!)
  def sum([]), do: 0

  # 2. RECURSIVE STEP: Pehla number nikalo aur baqi list ko dobara sum karo.
  def sum([head | tail]) do
    head + sum(tail)
  end
end

# => 6
IO.puts(Math.sum_list([1, 2, 3], 0))
