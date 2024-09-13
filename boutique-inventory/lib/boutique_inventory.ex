defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &{&1.price})
  end

  def with_missing_price(inventory) do
    Enum.reduce(inventory, [], fn
      %{price: nil} = item, acc -> acc ++ [item]
      _item, acc -> acc
    end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn %{name: name} = item ->
      name = String.replace(name, old_word, new_word)
      Map.put(item, :name, name)
    end)
  end

  def increase_quantity(%{quantity_by_size: quantities} = item, count) do
    updated_quanitites =
      quantities
      |> Enum.map(fn {key, quantity} -> {key, quantity + count} end)
      |> Map.new()

    Map.put(item, :quantity_by_size, updated_quanitites)
  end

  def total_quantity(%{quantity_by_size: quantities} = item) do
    quantities
    |> Enum.reduce(0, fn {_size, count}, acc ->
      acc + count
    end)
  end
end
