defmodule Gnat.Statix do
  use Statix
end
Gnat.Statix.connect()

{:ok, gnat} = Gnat.start_link(%{}, name: :streaming_connection)
{:ok, client} = Gnat.Streaming.Client.start_link([connection_name: :streaming_connection], name: :streaming_client)

tasks = Enum.map(1..16, fn(_i) ->
  Task.async(fn ->
    Enum.each(1..100_000, fn(i) ->
      Gnat.Streaming.Client.pub(client, "ohai", "ohai_#{i}")
      Gnat.Statix.increment("pubd")
    end)
  end)
end)
Enum.each(tasks, fn(task) -> Task.await(task, 600_000) end)
