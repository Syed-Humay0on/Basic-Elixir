# counter.ex
# Run: elixir counter.ex

defmodule Counter do
  # Use GenServer behavior (pre-defined callbacks)
  use GenServer

  # ========== CLIENT API (runs in caller process) ==========

  def start_link(initial_value) do
    # Start the GenServer process with initial state
    GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
  end

  def increment do
    # Synchronous call: waits for response
    GenServer.call(__MODULE__, :increment)
  end

  def get_count do
    # Synchronous call: gets current state
    GenServer.call(__MODULE__, :get_count)
  end

  # ========== SERVER CALLBACKS (runs in GenServer process) ==========

  # Initialize state
  def init(initial_value) do
    {:ok, initial_value}  # Return initial state
  end

  # Handle synchronous :increment call
  def handle_call(:increment, _from, state) do
    new_state = state + 1
    # Reply to caller with new value, update state
    {:reply, new_state, new_state}
  end

  # Handle synchronous :get_count call
  def handle_call(:get_count, _from, state) do
    # Reply with current state, keep state unchanged
    {:reply, state, state}
  end
end

# ========== USAGE ==========

defmodule Main do
  def run do
    # Start the GenServer with initial count 0
    Counter.start_link(0)

    # These are concurrent-safe! No locks needed!
    IO.puts("Count: #{Counter.get_count()}")  # 0
    IO.puts("Incremented: #{Counter.increment()}")  # 1
    IO.puts("Incremented: #{Counter.increment()}")  # 2
    IO.puts("Count: #{Counter.get_count()}")  # 2
  end
end

Main.run()
