defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_h | t]), do: t

  def first([h | _t]), do: h

  def count(list) do
    Enum.reduce(list, 0, fn _language, acc ->
      acc + 1
    end)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
