defmodule Hesabu.Server do
  use GenServer

  alias Hesabu.Core

  def init(count) do
    {:ok, Core.new(count)}
  end

  def handle_cast(:inc, count) do
    {:noreply, Core.inc(count)}
  end

  def handle_cast(:dec, count) do
    {:noreply, Core.dec(count)}
  end

  def handle_call(:count, _from, count) do
    {:reply, count, count}
  end
end
