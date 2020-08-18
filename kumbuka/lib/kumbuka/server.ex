defmodule Kumbuka.Eraser.Server do
  use GenServer
  alias Kumbuka.Eraser

  def init({text, steps}) do
    {:ok, Eraser.new(text, steps)}
  end

  def handle_call(:erase, _from, eraser) do
    erased = Eraser.eraser(eraser)
    {:reply, erased.text, erased}
  end

  def handle_call(:progress, _from, eraser) do
    {:reply, eraser.text, eraser}
  end
end
