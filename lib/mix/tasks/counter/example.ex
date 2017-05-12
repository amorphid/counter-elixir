defmodule Mix.Tasks.Counter.Example do
  use Mix.Task

  @doc """
  An example of how counter state gets updates within a Counter pid.
  """
  def run(_cli_args) do
    IO.puts("#You can cut/paste this code into IEx shell!")

    {:ok, pid} = Counter.start_link()
    IO.puts("{:ok, pid} = Counter.start_link()")

    0 = Counter.read_count(pid)
    IO.puts("0 = Counter.read_count(pid)")

    :ok = Counter.increment_by_1(pid)
    IO.puts(":ok = Counter.increment_by_1(pid)")

    :ok = Counter.increment_by_1(pid)
    IO.puts(":ok = Counter.increment_by_1(pid)")

    :ok = Counter.increment_by_1(pid)
    IO.puts(":ok = Counter.increment_by_1(pid)")

    3 = Counter.read_count(pid)
    IO.puts("3 = Counter.read_count(pid)")
  end
end
