defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_digits, input_base, _output_base) when input_base < 2,
    do: {:error, "input base must be >= 2"}
  def convert(_digits, _input_base, output_base) when output_base < 2,
    do: {:error, "output base must be >= 2"}

  def convert(digits, input_base, output_base) do
    invalid_digits = Enum.any?(digits, &(&1 < 0 or &1 >= input_base))

    if invalid_digits do
      {:error, "all digits must be >= 0 and < input base"}
    else
      result =
        digits
        |> translate_to_common(input_base)
        |> translate_to_base(output_base)

      {:ok, result}
    end
  end

  defp translate_to_common(digits, base) do
    digits
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce(0, fn {num, index}, acc ->
      acc + num * base ** index
    end)
  end

  defp translate_to_base(number, base, acc \\ [])
  defp translate_to_base(0, _base, acc) do
    if acc == [] do
      [0]
    else
      acc
    end
  end

  defp translate_to_base(number, base, acc) do
    translated = rem(number, base)

    number
    |> div(base)
    |> translate_to_base(base, [translated | acc])
  end
end
