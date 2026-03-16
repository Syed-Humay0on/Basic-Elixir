# actor_model.ex
# Run with: elixir actor_model.ex

defmodule ActorModel do
  def main do
    # Create a process and capture its PID
    pid = spawn(fn ->
      # This function runs in the NEW process
      # receive blocks until a message arrives in this process's mailbox
      receive do
        message ->
          IO.puts("Got message: #{message}")
      end
    end)

    # Back in the main process: send message to the spawned process
    send(pid, "Hello there!")

    # Give the process time to receive and print before main exits
    # (In a real app, you'd use proper synchronization)
    Process.sleep(100)
  end
end

# Entry point: call the main function
ActorModel.main()
