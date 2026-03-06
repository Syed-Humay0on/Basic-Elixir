defmodule IO_Device do
  def input do
    IO.gets("What is your name?\n") 
    |> String.trim()
  end 
end
