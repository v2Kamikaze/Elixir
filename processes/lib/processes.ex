defmodule Processes do
  def main do
    current_ctx = self()
    child = spawn(fn -> send(current_ctx, {self(), "ola processo"}) end)

    receive do
      {child_1, value} -> IO.inspect([child_1, value])
        IO.inspect(current_ctx)
        IO.inspect(child)
    end
  end
end
