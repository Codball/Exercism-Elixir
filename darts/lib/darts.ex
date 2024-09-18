defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    radius = x*x + y*y

    cond do
      radius > 100 -> 0
      radius > 25 -> 1
      radius > 1 -> 5
      true -> 10
    end
  end
end
