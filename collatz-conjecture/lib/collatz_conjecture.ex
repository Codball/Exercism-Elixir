defmodule CollatzConjecture do
  require Integer

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0 do
    do_calc(input, 0)
  end

  def do_calc(1, acc), do: acc

  def do_calc(input, acc) when rem(input, 2) == 0 do
    input
    |> div(2)
    |> do_calc(acc + 1)
  end

  def do_calc(input, acc) do
    (3 * input + 1)
    |> do_calc(acc + 1)
  end
end
