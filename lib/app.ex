defmodule App do
  use Application

  def start(_type, _args) do
    children = [
      Cache,
      CounterSupervisor
    ]

    options = [strategy: :one_for_one, name: App.Supervisor]
    # This is not a module based supervisor, we are creating this directly
    Supervisor.start_link(children, options)
  end
end
