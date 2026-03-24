# lib/day03.ex
# Run with: iex -S mix
# Or: elixir lib/day03.ex (if no Mix project)

defmodule Day03 do
  @moduledoc """
  Demonstrates Map.get/3 vs pattern matching for accessing map values.
  
  Map.get/3 is better for:
  - Dynamic keys (user input, variables)
  - Optional fields that may not exist
  - When you need a default fallback
  
  Pattern matching is better for:
  - Required fields (enforces structure)
  - Multiple fields at once
  - Destructuring complex data
  """

  @doc """
  Generic field getter using Map.get/3.
  
  ## Why it's better for dynamic access:
  - `key` can be any variable (user input, config, etc.)
  - Returns default if key missing (no crash)
  - Works with any map structure
  
  ## Parameters
    - map: The map to search
    - key: The key to look up (string or atom)
  
  ## Examples
      iex> Day03.get_field(%{"name" => "Ali"}, "name")
      "Ali"
      
      iex> Day03.get_field(%{"name" => "Ali"}, "missing")
      "Not found"
  """
  def get_field(map, key) do
    # Map.get(map, key, default)
    # - map: the map to search
    # - key: what to look for  
    # - default: value if key not found (optional but recommended)
    Map.get(map, key, "Not found")
  end

  @doc """
  Pattern matching version - ONLY works for "name" key.
  Crashes if "name" is missing! Use when field is REQUIRED.
  """
  def get_name(%{"name" => name}), do: name
  def get_name(%{name: name}), do: name      # atom key fallback
  def get_name(_), do: "Unknown"

  @doc """
  Pattern matching multiple fields at once.
  Clean destructuring but rigid structure required.
  """
  def describe(%{"name" => name, "Occupation" => job, "city" => city}) do
    "#{name} is a #{job} in #{city}"
  end
  def describe(%{"name" => name}) do
    "#{name} (incomplete info)"
  end
  def describe(_) do
    "Unknown person"
  end

  @doc """
  Demo function showing both approaches side by side.
  Run: Day03.demo()
  """
  def demo do
    person = %{
      "name" => "Humayoon",
      "age" => 23,
      "city" => "Karachi",
      "Occupation" => "Nadra"
    }

    IO.puts("=== Map.get/3 (Dynamic) ===")
    IO.puts("Name: #{get_field(person, "name")}")
    IO.puts("Job: #{get_field(person, "Occupation")}")
    IO.puts("Salary: #{get_field(person, "salary")}")  # Missing, returns default
    
    # Dynamic key example
    field_to_lookup = "city"
    IO.puts("Dynamic lookup of '#{field_to_lookup}': #{get_field(person, field_to_lookup)}")

    IO.puts("\n=== Pattern Matching (Rigid but Safe) ===")
    IO.puts("Name: #{get_name(person)}")
    
    IO.puts("\n=== Multi-field Pattern Match ===")
    IO.puts(describe(person))

    IO.puts("\n=== Comparison ===")
    IO.puts("Map.get: Flexible, safe default, good for dynamic keys")
    IO.puts("Pattern match: Enforces structure, extracts multiple fields cleanly")
  end
end

# Auto-run demo if file executed directly
if __ENV__.file == Path.expand("lib/day03.ex") do
  Day03.demo()
end
