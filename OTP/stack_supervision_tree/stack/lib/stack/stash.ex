defmodule Stack.Stash do
  use GenServer
  def start_link(stack) do
    {:ok, _pid} = GenServer.start_link __MODULE__, stack
  end
  def get_value(pid) do
    GenServer.call(pid,:get_value)
  end
  def save_value(pid, value) do
    IO.puts "#{inspect pid} #{inspect value}"
    GenServer.cast(pid,{:save_value, value})
  end
  def handle_call(:get_value,_from, stack) do
    {:reply,stack,stack}
  end
  def handle_cast({:save_value, stack},_stack) do
    {:noreply, stack }
  end
end
