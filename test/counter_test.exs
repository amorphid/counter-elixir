defmodule CounterTest do
  use ExUnit.Case, async: true
  doctest Counter

  def increment(pid, iterations) do
    for _i <- (1..iterations) do
      :ok = Counter.increment_by_1(pid)
    end
  end

  setup do
    {:ok, counter} = Counter.start_link()
    {:ok, [counter: counter]}
  end

  test "incrementing the count by 1", c do
    counter = c[:counter]
    base_count = Counter.read_count(counter)
    _ = increment(counter, 1)
    new_count = Counter.read_count(counter)
    assert new_count == base_count + 1
  end

  test "incrementing the count by 50", c do
    counter = c[:counter]
    base_count = Counter.read_count(counter)
    _ = increment(counter, 50)
    new_count = Counter.read_count(counter)
    assert new_count == base_count + 50
  end
end
