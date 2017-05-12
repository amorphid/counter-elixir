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

  def init(_noargs) do
    state = 0
    {:ok, state}
  end

  # TODO:  Add &Counter.terminate/2 callback
end
