defmodule KitchenCalculator do
  @ml_conversions %{
    millilitier: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15
  }

  def get_volume({_unit, volume}), do: volume

  def to_milliliter({unit, volume}) do
    conversion = Map.get(@ml_conversions, unit, 1)
    {:milliliter, volume * conversion}
  end

  def from_milliliter(volume_pair, unit) do
    volume = get_volume(volume_pair)
    conversion = Map.get(@ml_conversions, unit, 1)

    {unit, volume / conversion}
  end

  def convert(volume_pair = {unit, volume}, convert_to_unit) do
    {_unit, milliliters} = to_milliliter(volume_pair)
    from_milliliter({:milliliters, milliliters}, convert_to_unit)
  end
end
