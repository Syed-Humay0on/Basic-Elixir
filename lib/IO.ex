defmodule IO_Device do
  def input do
    IO.gets("What is your name?\n") 
    |> String.trim()
    |> String.split()
    |> Enum.join()
  end 
  def caiptalize do
    IO.gets("Let's capitalize on this shit\n")
    |> String.capitalize()
  end
end
