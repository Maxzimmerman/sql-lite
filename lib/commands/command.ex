defmodule Command do
  @callback handle(any()) :: any()
end
