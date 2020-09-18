defmodule Kumbuka.Server do
  alias Kumbuka.Eraser
  use GenServer

  def init({text, steps}) do
    IO.inspect("==============================")
    {:ok, Eraser.new(text, steps)}
  end
# we are have another start_link in kumbuka.ex
  # def start_link(text, steps, name) do
  #   GenServer.start_link(__MODULE__, {text, steps}, name: name)
  # end

  def handle_cast(:stop, state), do: {:stop, :normal, state}

  def handle_cast(:flush, _state) do
    {:noreply, %{}}
  end

  def handle_call(:erase, _from, state) do
    reduced = Eraser.eraser(state)
    {:reply, reduced.text, reduced}
  end

  def handle_call(:get, _from, state) do
    {:reply, state.text, state}
  end

  # def child_spec({text, steps, name}) do
  #   %{id: name, start: {Kumbuka.Server, :start_link, [text, steps, name]}}
  # end
end
