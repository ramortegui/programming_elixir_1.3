defmodule Tokens do
  def respond do
    IO.inspect self()
    receive do 
      { pid, x } -> 
        IO.puts x
        send pid, x
    end
  end

  def sending({pid, name}) do
    send self(), { pid, name }
    respond()
  end

  def run do
    pid = self()
    spawn(Tokens ,:sending, [{ pid, "Ruben" }])
    spawn(Tokens ,:sending, [{ pid, "Dario" }])
    receive do
      x when is_bitstring(x) -> IO.puts x
      after 500 -> IO.puts "Error waiting first message."
    end
    receive do
      x when is_bitstring(x) -> IO.puts x
      after 500 -> IO.puts "Error waiting second message."
    end
  end
end
