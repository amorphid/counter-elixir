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
  Hello world.  Let this function in here so one could see how doc tests works.

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

  @doc """
  Increments the count by 1.
  """
  def handle_call(:increment_by_1, _from, state) do
    new_state = state + 1
    {:reply, :ok, new_state}
  end

  @doc """
  Returns the current count.
  """
  def handle_call(:read_count, _from, state) do
    {:reply, state, state}
  end

  @doc """
  Initializes the Counter process.
  """
  def init(_noargs) do
    state = 0
    {:ok, state}
  end

  @doc """
  Logs an error when process is being terminated.
  """
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
