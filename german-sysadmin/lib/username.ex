defmodule Username do
  @character_conversions %{
    ?ä => ~c'ae',
    ?ö => ~c'oe',
    ?ü => ~c'ue',
    ?ß => ~c'ss'
  }

  def sanitize(list, acc \\ [])
  def sanitize([h | t], acc) when h >= ?a and h <= ?z, do: sanitize(t, acc ++ [h])
  def sanitize([h | t], acc) when h == ?_, do: sanitize(t, acc ++ [h])
  def sanitize([h | t], acc) do
    case Map.get(@character_conversions, h, 0) do
      0 -> sanitize(t, acc)
      charlist -> sanitize(t, acc ++ charlist)
    end
  end

  def sanitize([], acc), do: acc
end
