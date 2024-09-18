defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count(~c"AATAA", ?A)
  4

  iex> NucleotideCount.count(~c"AATAA", ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    Enum.count(strand, & &1 == nucleotide)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram(~c"AATAA")
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    map =
      @nucleotides
      |> Enum.map(& {&1, 0})
      |> Enum.into(%{})

    Enum.reduce(strand, map, fn nucleotide, acc ->
      count = Map.get(acc, nucleotide, 0)
      Map.put(acc, nucleotide, count + 1)
    end)
  end

  # alternate solution:
  # def histogram(strand) do
  #   Map.new(@nucleotides, fn x -> {x, count(strand, x)} end)
  # end
end
