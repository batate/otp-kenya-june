defmodule Kumbuka.Eraser.Client do
  alias Kumbuka.Eraser.Server

  def start(text, steps \\ 1) do
    {:ok, pid} = GenServer.start_link({text, steps})
    pid
  end

  def erase(eraser) do
    GenServer.call(eraser, :erase)
  end

  def progress(eraser) do
    GenServer.call(eraser, :progress)
  end
end
