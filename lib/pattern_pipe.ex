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
end
