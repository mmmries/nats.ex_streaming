# based on https://github.com/nats-io/stan.go/blob/c15b0a21309c2f183a4bd36d9052bf7ee3d817ed/pb/protocol.proto
# version 0.6.0 of stan.go
# Generated using https://github.com/tony612/protobuf-elixir#generate-elixir-code and then changed the namespace from Pb.* to Nats.Streaming.Protocol.*
# version 0.7.1 of protobuf
defmodule Nats.Streaming.Protocol.StartPosition do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :NewOnly | :LastReceived | :TimeDeltaStart | :SequenceStart | :First

  field(:NewOnly, 0)
  field(:LastReceived, 1)
  field(:TimeDeltaStart, 2)
  field(:SequenceStart, 3)
  field(:First, 4)
end

defmodule Nats.Streaming.Protocol.PubMsg do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clientID: String.t(),
          guid: String.t(),
          subject: String.t(),
          reply: String.t(),
          data: binary,
          connID: binary,
          sha256: binary
        }
  defstruct [:clientID, :guid, :subject, :reply, :data, :connID, :sha256]

  field(:clientID, 1, type: :string)
  field(:guid, 2, type: :string)
  field(:subject, 3, type: :string)
  field(:reply, 4, type: :string)
  field(:data, 5, type: :bytes)
  field(:connID, 6, type: :bytes)
  field(:sha256, 10, type: :bytes)
end

defmodule Nats.Streaming.Protocol.PubAck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          guid: String.t(),
          error: String.t()
        }
  defstruct [:guid, :error]

  field(:guid, 1, type: :string)
  field(:error, 2, type: :string)
end

defmodule Nats.Streaming.Protocol.MsgProto do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sequence: non_neg_integer,
          subject: String.t(),
          reply: String.t(),
          data: binary,
          timestamp: integer,
          redelivered: boolean,
          redeliveryCount: non_neg_integer,
          CRC32: non_neg_integer
        }
  defstruct [
    :sequence,
    :subject,
    :reply,
    :data,
    :timestamp,
    :redelivered,
    :redeliveryCount,
    :CRC32
  ]

  field(:sequence, 1, type: :uint64)
  field(:subject, 2, type: :string)
  field(:reply, 3, type: :string)
  field(:data, 4, type: :bytes)
  field(:timestamp, 5, type: :int64)
  field(:redelivered, 6, type: :bool)
  field(:redeliveryCount, 7, type: :uint32)
  field(:CRC32, 10, type: :uint32)
end

defmodule Nats.Streaming.Protocol.Ack do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          subject: String.t(),
          sequence: non_neg_integer
        }
  defstruct [:subject, :sequence]

  field(:subject, 1, type: :string)
  field(:sequence, 2, type: :uint64)
end

defmodule Nats.Streaming.Protocol.ConnectRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clientID: String.t(),
          heartbeatInbox: String.t(),
          protocol: integer,
          connID: binary,
          pingInterval: integer,
          pingMaxOut: integer
        }
  defstruct [:clientID, :heartbeatInbox, :protocol, :connID, :pingInterval, :pingMaxOut]

  field(:clientID, 1, type: :string)
  field(:heartbeatInbox, 2, type: :string)
  field(:protocol, 3, type: :int32)
  field(:connID, 4, type: :bytes)
  field(:pingInterval, 5, type: :int32)
  field(:pingMaxOut, 6, type: :int32)
end

defmodule Nats.Streaming.Protocol.ConnectResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pubPrefix: String.t(),
          subRequests: String.t(),
          unsubRequests: String.t(),
          closeRequests: String.t(),
          error: String.t(),
          subCloseRequests: String.t(),
          pingRequests: String.t(),
          pingInterval: integer,
          pingMaxOut: integer,
          protocol: integer,
          publicKey: String.t()
        }
  defstruct [
    :pubPrefix,
    :subRequests,
    :unsubRequests,
    :closeRequests,
    :error,
    :subCloseRequests,
    :pingRequests,
    :pingInterval,
    :pingMaxOut,
    :protocol,
    :publicKey
  ]

  field(:pubPrefix, 1, type: :string)
  field(:subRequests, 2, type: :string)
  field(:unsubRequests, 3, type: :string)
  field(:closeRequests, 4, type: :string)
  field(:error, 5, type: :string)
  field(:subCloseRequests, 6, type: :string)
  field(:pingRequests, 7, type: :string)
  field(:pingInterval, 8, type: :int32)
  field(:pingMaxOut, 9, type: :int32)
  field(:protocol, 10, type: :int32)
  field(:publicKey, 100, type: :string)
end

defmodule Nats.Streaming.Protocol.Ping do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          connID: binary
        }
  defstruct [:connID]

  field(:connID, 1, type: :bytes)
end

defmodule Nats.Streaming.Protocol.PingResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          error: String.t()
        }
  defstruct [:error]

  field(:error, 1, type: :string)
end

defmodule Nats.Streaming.Protocol.SubscriptionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clientID: String.t(),
          subject: String.t(),
          qGroup: String.t(),
          inbox: String.t(),
          maxInFlight: integer,
          ackWaitInSecs: integer,
          durableName: String.t(),
          startPosition: Nats.Streaming.Protocol.StartPosition.t(),
          startSequence: non_neg_integer,
          startTimeDelta: integer
        }
  defstruct [
    :clientID,
    :subject,
    :qGroup,
    :inbox,
    :maxInFlight,
    :ackWaitInSecs,
    :durableName,
    :startPosition,
    :startSequence,
    :startTimeDelta
  ]

  field(:clientID, 1, type: :string)
  field(:subject, 2, type: :string)
  field(:qGroup, 3, type: :string)
  field(:inbox, 4, type: :string)
  field(:maxInFlight, 5, type: :int32)
  field(:ackWaitInSecs, 6, type: :int32)
  field(:durableName, 7, type: :string)
  field(:startPosition, 10, type: Nats.Streaming.Protocol.StartPosition, enum: true)
  field(:startSequence, 11, type: :uint64)
  field(:startTimeDelta, 12, type: :int64)
end

defmodule Nats.Streaming.Protocol.SubscriptionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ackInbox: String.t(),
          error: String.t()
        }
  defstruct [:ackInbox, :error]

  field(:ackInbox, 2, type: :string)
  field(:error, 3, type: :string)
end

defmodule Nats.Streaming.Protocol.UnsubscribeRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clientID: String.t(),
          subject: String.t(),
          inbox: String.t(),
          durableName: String.t()
        }
  defstruct [:clientID, :subject, :inbox, :durableName]

  field(:clientID, 1, type: :string)
  field(:subject, 2, type: :string)
  field(:inbox, 3, type: :string)
  field(:durableName, 4, type: :string)
end

defmodule Nats.Streaming.Protocol.CloseRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clientID: String.t()
        }
  defstruct [:clientID]

  field(:clientID, 1, type: :string)
end

defmodule Nats.Streaming.Protocol.CloseResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          error: String.t()
        }
  defstruct [:error]

  field(:error, 1, type: :string)
end
