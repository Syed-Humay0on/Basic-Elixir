defmodule day01 do
 def greet(:male, name), do: "Mr. #{name}"
 def greet(:female, name), do: "Mrs. #{name}"
 def greet(_, name), do: name 



end
