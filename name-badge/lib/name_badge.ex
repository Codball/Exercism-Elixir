defmodule NameBadge do
  def print(nil, name, department) do
    if department do
      "#{name} - #{String.upcase(department)}"
    else
      "#{name} - OWNER"
    end
  end

  def print(id, name, department) do
    if department do
      "[#{id}] - #{name} - #{String.upcase(department)}"
    else
      "[#{id}] - #{name} - OWNER"
    end
  end
end
