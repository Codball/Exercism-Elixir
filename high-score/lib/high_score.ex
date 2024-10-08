defmodule HighScore do
  @default_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @default_score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @default_score)
  end

  def update_score(scores, name, score) do
    current_score = Map.get(scores, name, 0)
    Map.put(scores, name, score + current_score)
  end

  def get_players(scores) do
    Enum.map(scores, fn {name, _score} -> name end)
  end
end
