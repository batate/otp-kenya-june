defmodule Kumbuka.Server do
  use GenServer

  alias Kumbuka.Eraser

  # clients
  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def get_text(pid) do
    GenServer.call(pid, :get_text)
  end

  def erase(pid) do
    GenServer.call(pid, :erase)
  end

  # callbacks 
  def init(state) do
    {:ok, state}
  end

  def handle_call(:get_text, _from, _state) do
    text = text()
    steps = Enum.random(6..10)
    new_state = Eraser.new(text, steps)
    {:reply, text, new_state}
  end

  def handle_call(:erase, _from, new) do
    new_state = Eraser.eraser(new)
    {:reply, new_state.text, new_state}
  end

  defp text do
    "Creeps in this petty pace from day to day,
     To the last syllable of recorded time;"
  end
end
