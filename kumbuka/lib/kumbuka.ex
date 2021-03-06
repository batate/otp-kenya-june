defmodule Kumbuka do
  @moduledoc """
  Documentation for `Kumbuka`.
  """
  alias Kumbuka.Server

  def start_link(text, steps) do
    {:ok, server} = GenServer.start_link(Server, {text, steps})
    print_text(server)
    server
  end

  def stop(pid), do: GenServer.cast(pid, :stop)

  def print_text(server) do
    text = GenServer.call(server, :get)
    IO.puts text
  end

  def erase(server) do
    GenServer.call(server, :erase)
    print_text(server)
  end

  def flush(name) do
    GenServer.cast(name, :flush)
  end
end
