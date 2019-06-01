defmodule Gnat.Statix do
  use Statix
end
Gnat.Statix.connect()

defmodule MessageHandler do
  def handle(message) do
    Gnat.Statix.increment("recvd")
    Gnat.Streaming.Message.ack(message)
    Gnat.Statix.increment("ackd")
  end
end

{:ok, gnat} = Gnat.start_link(%{}, name: :streaming_connection)
{:ok, client} = Gnat.Streaming.Client.start_link([connection_name: :streaming_connection], name: :streaming_client)
{:ok, subscription} = Gnat.Streaming.Subscription.start_link(client_name: :streaming_client, subject: "ohai", consuming_function: {MessageHandler, :handle})


:timer.sleep(1_000_000_000)
