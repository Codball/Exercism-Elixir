defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2), do: do_hamming_distance(strand1, strand2)

  defp do_hamming_distance(strand1, strand2, _) when length(strand1) != length(strand2),
    do: {:error, "strands must be of equal length"}

  defp do_hamming_distance(strand1, strand2, distance \\ 0)
  defp do_hamming_distance([], [], distance), do: {:ok, distance}

  defp do_hamming_distance([letter1 | tail1], [letter1 | tail2], distance),
    do: do_hamming_distance(tail1, tail2, distance)

  defp do_hamming_distance([_ | tail1], [_ | tail2], distance),
    do: do_hamming_distance(tail1, tail2, distance + 1)

  # def hamming_distance(strand1, strand2) do
  #   count = Enum.zip(strand1, strand2)
  #           |> Enum.count(fn {x, y} -> x != y end)
  #   {:ok, count}
  # end
end
