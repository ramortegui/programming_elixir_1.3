defmodule Stack do
  use GenServer

  def start_link( stack \\ [] ) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__ )
  end
  def pop do
    GenServer.call __MODULE__, :pop
  end
  def push(val) do
    GenServer.cast __MODULE__, {:push, val}
  end
  def handle_call(:pop, _from, [h|t]) do
    {:reply, h, t }
  end
  def handle_cast({:push,val}, stack) do
    { :noreply, [ val | stack ] }
  end
end
