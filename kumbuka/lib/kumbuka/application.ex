defmodule Kumbuka.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
  IO.puts("-----Starting Kumbuka-----")
    children = [
      # Starts a worker by calling: Kumbuka.Worker.start_link(arg)
      # {Kumbuka.Worker, arg}
      {DynamicSupervisor, strategy: :one_for_one, name: Kumbuka.DynamicSupervisor}
      # {Kumbuka, {"this is a short string", 5, :pollet}},
      # {Kumbuka, {"this is a slightly longer string", 5, :second}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kumbuka.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
