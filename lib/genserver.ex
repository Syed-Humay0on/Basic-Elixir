defmodule Gen_Server do
  use GenServer

  # Required callback: initialize state
  def init(initial_state) do
    {:ok, initial_state}
  end

  # Optional: handle calls
  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end
end

# ========== CORRECT USAGE ==========

# Start with SINGLE underscore atom name
# {:ok, pid} = GenServer.start_link(Gen_Server, %{gen: []}, name: :gen_server)

# Lookup with SAME atom
# GenServer.whereis(:gen_server)
# Returns: #PID<0.216.0>  ✓

# Or call it
# GenServer.call(:gen_server, :get)
# Returns: %{gen: []}
