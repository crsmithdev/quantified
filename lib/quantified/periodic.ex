defmodule Quantified.Periodic do
  use GenServer

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    do_work()
    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do
    do_work()
    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 10 * 1000) # In 2 hours
  end

  defp do_work() do
    {:ok, response} = HTTPoison.get "https://www.rescuetime.com/anapi/daily_summary_feed?key=B63ypZVTcXozmSfOaZbT2IpzYfmu2AbNZh1c8poZ"
    decoded = Poison.decode! response.body
    IO.puts response.body
  end
end
