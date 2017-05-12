defmodule CounterTest do
  use ExUnit.Case, async: true
  doctest Counter

  setup do
    {:ok, counter} = Counter.start_link()
    {:ok, [counter: counter]}
  end

  test "incrementing the count by 1", c do
    counter = c[:counter]
    base_count = GenServer.call(counter, :read_count)
    :ok = GenServer.call(counter, :increment_by_1)
    new_count = GenServer.call(counter, :read_count)
    assert new_count == base_count + 1
  end
end
