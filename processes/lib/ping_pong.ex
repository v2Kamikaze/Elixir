defmodule Ping do
  def start() do
    wait()
  end

  def wait() do
    receive do
      {pid, :pong} ->
        send(pid, {self(), :ping})
        IO.puts("Recebi	um	Pong")
        Process.sleep(1000)
    end

    wait()
  end
end

defmodule Pong do
  def start() do
    wait()
  end

  def wait() do
    receive do
      {pid, :ping} ->
        send(pid, {self(), :pong})
        IO.puts("Recebi	um	Ping")
        Process.sleep(1000)
    end

    wait()
  end
end

defmodule	Table do
  def	start()	do
      pid_ping	=	spawn(Ping,	:start,	[])
      pid_pong	=	spawn(Pong,	:start,	[])
      send(pid_ping,	{pid_pong,	:pong})
  end
end
