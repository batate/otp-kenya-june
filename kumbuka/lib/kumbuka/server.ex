defmodule Kumbuka.Server do
  use GenServer

  alias Kumbuka.Eraser

  def init({text, no_of_steps}) do
    {:ok, Eraser.new(text, no_of_steps)}
  end

  def handle_cast(:eraser, erased_value) do
    {:noreply, Eraser.eraser(erased_value)}
  end

  def handle_call(:new_text, _from, erased_value) do
    {:reply, erased_value.text, erased_value.text}
  end
end
