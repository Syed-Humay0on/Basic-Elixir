# actor_model_fixed.ex

defmodule ActorModel2 do
  def main do
    # Spawn the worker, passing main's PID so worker can reply
    main_pid = self()
    worker_pid = spawn(fn -> worker(main_pid) end)

    # Now send the actual message to the worker
    send(worker_pid, "Hello there!")

    # Block waiting for worker to finish
    receive do
      :done -> IO.puts("Main: Worker completed successfully")
    end
  end

  # Worker runs in separate process
  defp worker(main_pid) do
    receive do
      message ->
        IO.puts("Worker got: #{message}")
        # Notify main process we're done
        send(main_pid, :done)
    end
  end
end

# Run it
ActorModel2.main()
