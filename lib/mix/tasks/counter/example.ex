defmodule Mix.Tasks.Counter.Example do
  use Mix.Task

  @doc """
  An example of how counter state gets updates within a Counter pid.
  """
  def run(_cli_args) do
    IO.puts("#You can cut/paste this code into IEx shell!")

    {:ok, pid} = Counter.start_link()
    IO.puts("{:ok, pid} = Counter.start_link()")

    0 = GenServer.call(pid, :read_count)
    IO.puts("0 = GenServer.call(pid, :read_count)")

    :ok = GenServer.call(pid, :increment_by_1)
    IO.puts(":ok = GenServer.call(pid, :increment_by_1)")

    :ok = GenServer.call(pid, :increment_by_1)
    IO.puts(":ok = GenServer.call(pid, :increment_by_1)")

    :ok = GenServer.call(pid, :increment_by_1)
    IO.puts(":ok = GenServer.call(pid, :increment_by_1)")

    3 = GenServer.call(pid, :read_count)
    IO.puts("3 = GenServer.call(pid, :read_count)")
  end
end
