defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color, opts \\ []) do
    cellar
    |> filter_by_color(color)
    |> filter_by_year(opts[:year])
    |> filter_by_country(opts[:country])
  end

  # first blind attempt:
  # def filter(cellar, color, []), do: filter_by_color(cellar, color)
  # def filter(cellar, color, opts) do
  #   wines = filter_by_color(cellar, color)

  #   opts
  #   |> Enum.reduce(wines, fn opt, acc ->
  #     case opt do
  #       {:year, year} -> filter_by_year(acc, year)
  #       {:country, country} -> filter_by_country(acc, country)
  #     end
  #   end)
  # end

  # defp filter_by_color(wines, color) do
  #   Enum.flat_map(wines, fn {wine_color, info} ->
  #     if wine_color == color do
  #       [info]
  #     else
  #       []
  #     end
  #   end)
  # end

  defp filter_by_color([], _color), do: []
  defp filter_by_color([{color, wine} | tail], color) do
    [wine | filter_by_color(tail, color)]
  end

  defp filter_by_color([{_, _} | tail], color) do
    filter_by_color(tail, color)
  end

  defp filter_by_year(wines, year)
  defp filter_by_year(wines, nil), do: wines
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country(wines, nil), do: wines
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
