defmodule BirdCount do
  def today([]), do: nil
  def today([h | _t]), do: h

  def increment_day_count([]), do: [1]
  def increment_day_count([h | t]), do: [h + 1 | t]

  def has_day_without_birds?([0 | _t]), do: true
  def has_day_without_birds?([_h | t]), do: has_day_without_birds?(t)
  def has_day_without_birds?([]), do: false

  def total(list, count \\ 0)
  def total([h | t], count), do: total(t, count + h)
  def total([], count), do: count

  def busy_days(list, count \\ 0)
  def busy_days([h | t], count) when h >= 5, do: busy_days(t, count + 1)
  def busy_days([_h | t], count), do: busy_days(t, count)
  def busy_days([], count), do: count
end
