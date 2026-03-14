defmodule PipeCase2 do
  def process_response(response) do
    response
    |> extract_body()
    |> handle_body()
  end

  defp extract_body({:ok, %{body: body}}), do: {:ok, body}
  defp extract_body({:ok, _}), do: {:error, :no_body}
  defp extract_body({:error, reason}), do: {:error, reason}

  defp handle_body({:ok, body}) do
    body
    |> Jason.decode!()
    |> case do
      %{"status" => "success", "data" => data} -> {:ok, data}
      %{"error" => msg} -> {:error, msg}
    end
  end

  defp handle_body(error), do: error

  # Ye zero-argument (/0) helper hai testing ke liye
  def demo() do
    dummy_response = {:ok, %{body: ~s({"status": "success", "data": "Hello jani"})}}
    process_response(dummy_response)
  end

  # baqi extract_body aur handle_body same...
end
