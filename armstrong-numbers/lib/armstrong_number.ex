defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) when number < 10 and number >= 0, do: true

  def valid?(number) do
    digits = Integer.digits(number)
    power = length(digits)
    calc = Enum.reduce(digits, 0, & &1 ** power + &2)

    calc == number
  end
end
