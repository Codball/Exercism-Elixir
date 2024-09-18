defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.reduce([], fn candidate, acc ->
      lower_case_base = String.downcase(base)
      lower_case_candidate = String.downcase(candidate)

      cond do
        lower_case_base == lower_case_candidate -> acc
        String.bag_distance(lower_case_base, lower_case_candidate) == 1 -> acc ++ [candidate]
        true -> acc
      end
    end)
  end
end
