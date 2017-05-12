defmodule Counter do
  @moduledoc """
  Documentation for Counter.
  """

  #######
  # API #
  #######

  @doc """
  Creates an anonymous GenServer process (aka an unnamed pid).  Starts w/
  """
  def start_link() do
    GenServer.start_link(__MODULE__, :noargs)
  end

  @doc """
  Hello world.

  ## Examples

      iex> Counter.hello
      :world

  """
  def hello do
    :world
  end

  #############
  # Callbacks #
  #############

  # TODO:  Add &Counter.handle_call/3 for :increment_by_1

  @doc """
  Returns the current count.
  """
  def handle_call(:read_count, _from, state) do
    {:reply, state, state}
  end

  def init(_noargs) do
    state = 0
    {:ok, state}
  end

  def terminate(reason, state) do
    require Logger

    :ok = Logger.error("""

    >> Error:

    Counter #{inspect(self())} being terminated.  This shouldn't happen.

    >> Reason:

    #{inspect(reason)}

    | State:

    #{inspect(state)}

    >> Env:

    #{inspect(__ENV__)}
    """)
  end
end
