defmodule EndToEndTest do
  use ExUnit.Case, async: true

  def consume(msg) do
    send(:streaming_functional_test, {:message_received, msg})
  end

  def wait_for_subscription_to_be_subscribed(pid) do
    case Nats.Streaming.Subscription.subscribed?(pid) do
      false ->
        :timer.sleep(10)
        wait_for_subscription_to_be_subscribed(pid)

      true ->
        :ok
    end
  end

  @tag capture_log: true
  test "it can subscribe and publish to NATS streaming" do
    Process.register(self(), :streaming_functional_test)
    {:ok, gnat} = Gnat.start_link(%{}, name: :streaming_connection)

    {:ok, _client} =
      Nats.Streaming.Client.start_link([connection_name: :streaming_connection],
        name: :streaming_client
      )

    {:ok, subscription} =
      Nats.Streaming.Subscription.start_link(
        client_name: :streaming_client,
        subject: "ohai",
        consuming_function: {EndToEndTest, :consume}
      )

    wait_for_subscription_to_be_subscribed(subscription)

    Nats.Streaming.Client.pub(:streaming_client, "ohai", "What's up?")
    assert_receive {:message_received, msg}, 1_000
    assert msg.connection_pid == gnat
    assert msg.data == "What's up?"
    assert msg.redelivered == false
    assert msg.reply == ""
    assert msg.sequence >= 0
    assert msg.subject == "ohai"
    assert msg.timestamp >= 0
    assert Nats.Streaming.Message.ack(msg) == :ok
  end
end
