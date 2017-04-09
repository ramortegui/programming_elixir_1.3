defmodule Stack.Server do
  use GenServer

  def start_link( stack_pid ) do
    GenServer.start_link(__MODULE__, stack_pid , name: __MODULE__ )
  end
  def pop do
    GenServer.call __MODULE__, :pop
  end
  def push(val) do
    GenServer.cast __MODULE__, {:push, val}
  end

  def init(stash_pid) do
    stack = Stack.Stash.get_value stash_pid
    {:ok, {stack, stash_pid}}
  end
  def handle_call(:pop, _from, { [h|t], stash_pid}) do
    {:reply, h,{t, stash_pid}}
  end
  def handle_cast({:push,val}, { stack, stash_pid} ) do
    { :noreply, { [ val | stack], stash_pid} }
  end

  def terminate(_reason,{ stack, stash_pid}) do
    Stack.Stash.save_value stash_pid, stack
  end
end
