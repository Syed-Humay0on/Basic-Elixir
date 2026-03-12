defmodule PipePattern do
  # → 420
  def patternMatch do
    "42"
    # → {42, ""}
    |> Integer.parse()
    |> case do
      # perfect parse → use number
      {number, ""} -> number * 10
      # partial parse (jaise "42abc" → 42)
      {number, _leftover} -> number
      # nahi parse hua
      :error -> 0
    end

    # -> 420
  end

  def validation do
      IO.gets("expectung input\n")
      |> String.trim()
      |> Integer.parse()
      |> case do
        {num, ""} -> {:ok, num}
        _ -> {:error, :invalid_number}
      end
  end
end
