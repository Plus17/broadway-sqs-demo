defmodule SqsDemoTest do
  use ExUnit.Case
  doctest SqsDemo

  test "greets the world" do
    assert SqsDemo.hello() == :world
  end
end
