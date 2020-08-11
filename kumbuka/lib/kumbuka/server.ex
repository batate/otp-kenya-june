defmodule Kumbuka.Eraser.Server do
  use GenServer
  alias Kumbuka.Eraser

  def init({text, steps}) do
    {:ok, Eraser.new(text, steps)}
  end

  def handle_cast(:erase, eraser) do
    {:noreply, Eraser.eraser(eraser)}
  end

  def handle_call(:progress, _from, eraser) do
    {:reply, eraser, eraser}
  end
end
