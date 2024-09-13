# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn ->
      %{
        opts: opts,
        plots: [],
        count: 0
      }
    end)
  end

  def list_registrations(pid) do
    Agent.get(pid, & &1.plots)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{plots: plots, count: count} = state ->
      plot = %Plot{plot_id: count + 1, registered_to: register_to}

      new_state = state
      |> Map.put(:plots, [plot | plots])
      |> Map.put(:count, count + 1)

      {plot, new_state}
    end)
  end

  def release(pid, release_plot_id) do
    Agent.update(pid, fn %{plots: plots} = state ->
      saved_plots =
        Enum.reject(plots, fn %Plot{plot_id: plot_id} -> plot_id == release_plot_id end)

      state
      |> Map.put(:plots, saved_plots)
    end)
  end

  def get_registration(pid, get_plot_id) do
    Agent.get(pid, fn %{plots: plots} = state ->
      default = {:not_found, "plot is unregistered"}
      Enum.find(plots, default, fn %Plot{plot_id: plot_id} ->
        plot_id == get_plot_id
      end)
    end)
  end
end
