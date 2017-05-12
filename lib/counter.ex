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

  # TODO:  Add &Counter.init/1 callback

  @doc """
  Hello world.

  ## Examples

      iex> Counter.hello
      :world

  """
  def hello do
    :world
  end
end
