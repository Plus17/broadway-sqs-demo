# SqsDemo

Demo to work with Broadway and SQS (LocalStack). [Reference](https://hidnasio.github.io/elixir/2022/04/02/local-development-with-localstack-and-elixir-broadway.html?utm_medium=email&utm_source=elixir-radar)

[Amazon SQS Broadway Producer](https://hexdocs.pm/broadway/amazon-sqs.html)

## Installation

1. Clone the repository

```bash
git clone
```

2. Install dependencies
```elixir
mix deps.get && mix deps.compile
```

3. Start LocalStack
```bash
docker-compose up
```

4. Send some messages
```elixir
iex(17)> Enum.each(1..10, fn _index -> SqsDemo.send_message() end)
:ok
```

Broadway will process the messages.
