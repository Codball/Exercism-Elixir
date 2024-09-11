defmodule FreelancerRates do
  @billable_hours 8.0
  @billable_days 22

  def daily_rate(hourly_rate) do
    hourly_rate * @billable_hours
  end

  def apply_discount(before_discount, discount) do
    rate = before_discount * (discount / 100)
    before_discount - rate
  end

  def monthly_rate(hourly_rate, discount) do
    rate_before_discount = @billable_days * daily_rate(hourly_rate)

    rate_before_discount
    |> apply_discount(discount)
    |> Float.ceil(0)
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_rate =
      hourly_rate
      |> daily_rate()
      |> apply_discount(discount)

    days = budget / discounted_rate
    Float.floor(days, 1)
  end
end
