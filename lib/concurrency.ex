# 1. Pehle Dukaan (Shop) ka module banate hain
defmodule BiryaniShop do
  
  # Shop ko start karne ka function
  def start do
    # 'spawn' se ek naya "Actor" (Process) banta hai jo background mein chalta rahega
    spawn(fn -> loop() end)
  end

  # Ye shop ka main kaam hai: Intezar karna
  defp loop do
    receive do
      # Agar koi 'order' aaye toh:
      {:order, sender_pid, plate_count} ->
        IO.puts("[Shop] #{plate_count} plate biryani ka order mila!")
        
        # Thora time lagta hai banane mein (1 second)
        :timer.sleep(1000)
        
        # Order tayar! Wapis bhejo customer ko
        send(sender_pid, {:ready, "Garma Garam Biryani"})
        
        # Dobara loop chalao taake agla order le sakein
        loop()

      # Shop band karne ka msg
      :chutti ->
        IO.puts("[Shop] Dukaan barhayi ja rahi hai. Allah Hafiz!")
    end
  end
end

# --- RUN KARNE KA TAREEQA ---

# 2. Dukaan kholi (Process start kiya)
shop_pid = BiryaniShop.start()

# 3. Customer ne order diya
# self() ka matlab hai "Mera address" taake shop wapis bheje
send(shop_pid, {:order, self(), 2})

# 4. Customer ab apna "Mailbox" check kar raha hai
receive do
  {:ready, khana} ->
    IO.puts("[Customer] Mil gayi! #{khana}")
end
