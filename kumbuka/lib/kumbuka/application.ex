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
      {Kumbuka, {"i can't see them coming down my eyes so I gotta make the song cry", 4, :jayz}}
      #another option of passing the passage where the name is similar
      #to the passage 
      #{Kumbuka, {Kumbuka.Passages.passage(:frank), 3, :frank}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kumbuka.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
