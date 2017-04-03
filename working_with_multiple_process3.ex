defmodule EixProcess do
  import :timer, only: [sleep: 1]
  def send_message(pid,msg) do
    send pid,{:ok,"#{msg} done #{inspect pid}"}
    #exit(:boom)
    raise("something wrong happend here")
  end
  def spawning do
    pid = self()
    #spawn_link(EixProcess,:send_message,[ pid, "hello" ])
    spawn_monitor(EixProcess,:send_message,[ pid, "hello" ])
    sleep(500)
    receive do
      { :ok,txt } -> IO.puts txt
      after 500 ->
          IO.puts "nothing happends"
    end
  end
end
