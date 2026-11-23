defmodule Commands.PageSize do
  @behaviour Command

  @impl true
  def handle(input) do
    IO.inspect(input, label: "CALLED")
  end
end
