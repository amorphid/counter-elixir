defmodule CounterTest do
  use ExUnit.Case, async: true
  doctest Counter

  setup do
    {:ok, counter} = Counter.start_link()
    {:ok, [counter: counter]}
  end

  test "incrementing the count by 1", c do
    counter = c[:counter]
    base_count = Counter.read_count(counter)
    :ok = Counter.increment_by_1(counter)
    new_count = Counter.read_count(counter)
    assert new_count == base_count + 1
  end
end
