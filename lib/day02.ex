defmodule Day02 do
  # List Destructuring
  def get_first([head | _]), do: head
  def get_first([]), do: nil

  # Map Matching
  def get_name(%{"name" => name}), do: name
  def get_name(%{name: name}), do: name
  def get_name(_), do: "Unknown"

  # Matching on Tuples
  def handle_response({:ok, data}), do: "Success: #{inspect(data)}"
  def handle_response({:error, reason}), do: "Error: #{reason}"
  def handle_response(_), do: "Unexpected response"

  # Guard clause for age comparison
  def validate_age(age1, age2) when age1 == age2, do: "Same age!"
  def validate_age(_, _), do: "Different age!"
end

# Test Data
person = %{"name"=> "Sarah", "age"=> 30, "city"=> "Berlin"}
list = [1,2,3,4,5]

# Correct Calls
IO.puts(Day02.get_name(person))      # "Sarah" - map with name
IO.puts(Day02.get_first(list))       # "1" - first element of list
IO.puts(Day02.handle_response({:ok, "data loaded"}))
IO.puts(Day02.validate_age(30, 30))
