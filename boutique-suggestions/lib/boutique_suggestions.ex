defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    for top <- tops,
        bottom <- bottoms,
        filter_combinations(top, bottom, options) do
      {top, bottom}
    end
  end

  defp filter_combinations(
         %{base_color: base_color_top, price: price_top} = top,
         %{base_color: base_color_bottom, price: price_bottom} = bottom,
         options
       ) do
    price = price_top + price_bottom
    maximum_price = Keyword.get(options, :maximum_price, 100)

    different_colors? = base_color_top != base_color_bottom

    different_colors? && price <= maximum_price
  end
end
