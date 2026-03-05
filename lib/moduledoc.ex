defmodule MathUtils do
  @moduledoc """
  Math related helper functions.
  """

  @doc """
  Do numbers ka sum nikaalta hai.

  ## Parameters
    - a: pehla number (integer/float)
    - b: doosra number

  ## Examples

      iex> MathUtils.sum(5, 7)
      12

      iex> MathUtils.sum(3.5, 2.5)
      6.0

  ## Edge cases
      iex> MathUtils.sum(0, 0)
      0
  """
  def sum(a, b) do
    a + b
  end

  @doc """
  List ke saare elements ka product nikaalta hai (multiplication).

  Returns 1 agar list empty ho (neutral element for multiplication).

  ## Examples

      iex> MathUtils.product([2, 3, 4])
      24

      iex> MathUtils.product([])
      1
  """
  def product(list) do
    Enum.reduce(list, 1, &(&1 * &2))
  end

  # Private function — usually @doc nahi lagate
  # defp double(x), do: x * 2
end
