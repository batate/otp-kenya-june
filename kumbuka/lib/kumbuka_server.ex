defmodule KumbukaServer do
  @moduledoc false

  use DynamicSupervisor

  def start_link(init_arg) do
    DynamicSupervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(init_arg) do
    DynamicSupervisor.init(init_arg)
  end

  def start_child({text, steps, name}) do
    DynamicSupervisor.start_child(__MODULE__, {Kumbuka.Server, {text, steps, name}})
  end
end
