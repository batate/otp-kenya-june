defmodule Kumbuka.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Kumbuka.Worker.start_link(arg)
      # {Kumbuka.Worker, arg}
      {Kumbuka.Server, {"this is a short string", 5, :pollet}},
      {Kumbuka.Server, {"this is a slightly longer string", 5, :second}},
      {KumbukaServer, strategy: :one_for_one, name: KumbukaServer}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kumbuka.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
