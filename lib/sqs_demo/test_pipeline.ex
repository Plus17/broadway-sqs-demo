defmodule SqsDemo.TestPipeline do
  use Broadway

  require Logger

  alias Broadway.Message

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
          module: {
          BroadwaySQS.Producer,
            queue_url: "http://localhost:4566/000000000000/sqs-demo",
            config: [
            scheme: "http://",
            host: "localhost",
            port: 4566,
            access_key_id: "",
            secret_access_key: ""
          ]
          }
      ],
      processors: [
           default: []
      ],
      batchers: [
        default: [
          batch_size: 10,
          batch_timeout: 2000
        ]
      ]
    )
  end

  @impl true
  def handle_message(_, %Message{data: _data} = message, _) do
    Logger.info("******* Message ********** ")
    Logger.info(fn -> "#{inspect(message)}" end)

    message
    |> Message.update_data(&process_data/1)
  end

  defp process_data(data) do
    Logger.debug("Processing data: #{inspect(data)}")

    data
  end

  @impl true
  @doc """
  Send batch of successful messages as ACKs to SQS.
  This tells SQS that this list of messages were successfully processed.
  """
  def handle_batch(_batcher, messages, _batch_info, _context) do
    list = messages |> Enum.map(fn e -> e.data end)
    IO.inspect(list, label: "Got batch of finished jobs from processors, sending ACKs to SQS as a batch.")
    messages
  end
end
