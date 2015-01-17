defmodule Slim do
  defdelegate render(source), to: Slim.Renderer
end
