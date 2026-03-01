# 1. Define the Shop module (The "Service" Actor)
defmodule CoffeeShop do
  # 2. This is the main loop for the Shop Actor
  def start_shop do
    IO.puts("[Shop] Opening for business...")
    # 3. We start the recursive loop
    loop()
  end

  # 4. Private loop function that waits for messages
  defp loop do
    # 5. 'receive' stops the process and waits for a "Coconut" (Message)
    receive do
      # 6. If we get an :order message, we process it
      {:order, customer_pid, item} ->
        IO.puts("[Shop] Received order for #{item} from #{inspect(customer_pid)}")
        # 7. Simulate making the coffee
        :timer.sleep(1000) 
        # 8. Send a message back to the Customer
        send(customer_pid, {:coffee_ready, item})
        # 9. Loop again to wait for the next customer
        loop()

      # 10. A "Shutdown" message to close the shop
      :close ->
        IO.puts("[Shop] Closing shop. Goodbye!")
    end
  end
end

# 11. Define the Customer module (The "Client" Actor)
defmodule Customer do
  def order_coffee(shop_pid, item) do
    IO.puts("[Customer] Ordering a #{item}...")
    # 12. Send a message to the shop, including our own PID (self()) 
    # so the shop knows who to reply to.
    send(shop_pid, {:order, self(), item})

    # 13. Now the Customer waits for the reply
    receive do
      {:coffee_ready, item} ->
        IO.puts("[Customer] Yay! My #{item} is ready. Time to drink!")
    after
      # 14. If the shop doesn't reply in 5 seconds, give up
      5000 -> IO.puts("[Customer] The shop is taking too long!")
    end
  end
end

# --- EXECUTION SECTION ---

# 15. Start the Shop process (This is the "Actor")
# 'spawn' returns a Process ID (PID)
shop_pid = spawn(fn -> CoffeeShop.start_shop() end)

# 16. Start the Customer logic
# Note: The Customer runs in the "Main" process here
Customer.order_coffee(shop_pid, "Latte")

# 17. Close the shop
send(shop_pid, :close)
