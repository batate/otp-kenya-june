defmodule Kumbuka do
  alias Kumbuka.Server

  def start(text, no_of_steps) do
    {:ok, pid} = GenServer.start_link(Server, {text, no_of_steps})
    pid
  end

  def erase(pid) do
    GenServer.cast(pid, :eraser)
  end

  def get(pid) do
    GenServer.call(pid, :new_text)
  end
end
