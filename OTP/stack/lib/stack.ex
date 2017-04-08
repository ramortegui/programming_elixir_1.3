defmodule Stack do
  use GenServer
  def handle_call(:pop, _from, [h|t]) do
    {:reply, h, t }
  end
  def handle_cast({:post,val}, stack) do
    { :noreply, [ val | stack ] }
  end
end
