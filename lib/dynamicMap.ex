defmodule MapKey do
  def maps() do
    user = %{name: "Alice", role: "admin"}
    field = :name
    # Outputs: Alice
    IO.puts(user[field])
  end
end
