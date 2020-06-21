defmodule Nats.Streaming do
  use Supervisor

  def hello, do: :world

  def start_link(args, opts) do
    Supervisor.start_link(__MODULE__, args, opts)
  end

  @impl true
  def init(_args) do
    Supervisor.init([], strategy: :rest_for_one)
  end
end
