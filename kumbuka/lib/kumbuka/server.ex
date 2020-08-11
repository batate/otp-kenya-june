defmodule Kumbuka.Server do
  use GenServer

  alias Kumbuka.Eraser

  # callbacks 
  def init({text, steps}) do
    new = Eraser.new(text, steps)
    {:ok, new}
  end

  def handle_call(:erase, _from, new) do
    new_state = Eraser.eraser(new)
    {:reply, new_state.text, new_state}
  end
end
