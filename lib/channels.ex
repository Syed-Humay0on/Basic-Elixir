defmodule Worker do
  def listen do
    receive do
      # 3. Wait for a specific message pattern
      {:data, value} ->
        IO.puts("Consumer: received #{value}")
        listen() # Loop to keep waiting for more messages
      :stop ->
        IO.puts("Consumer: shutting down")
    end
  end
end

# 1. Start the Consumer process and get its ID (PID)
consumer_pid = spawn(fn -> Worker.listen() end)

# 2. Producer logic: Send messages directly to that PID
Enum.each(1..3, fn i ->
  IO.puts("Producer: sending #{i}")
  send(consumer_pid, {:data, i})
end)

send(consumer_pid, :stop)

