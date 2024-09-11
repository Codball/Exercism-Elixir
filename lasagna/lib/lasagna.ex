defmodule Lasagna do
  @cook_time 40

  def expected_minutes_in_oven, do: @cook_time

  def remaining_minutes_in_oven(minutes_elapsed) do
    @cook_time - minutes_elapsed
  end

  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  def total_time_in_minutes(layers, minutes_elapsed) do
    preparation_time_in_minutes(layers) + minutes_elapsed
  end

  def alarm, do: "Ding!"
end
