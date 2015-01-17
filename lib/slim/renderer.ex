defmodule Slim.Renderer do
  def render(tokens) do
    tokens
    |> Slim.Tokenizer.tokenize
    |> render("")
  end

  defp render([], acc), do: acc
  defp render([token|tokens], acc) do
    render(tokens, render_token(token) <> acc)
  end

  defp render_token({:html, :doctype, type}) when type in ["", "5", "html"] do
    "<!DOCTYPE html>"
  end

  defp render_token({:html, :doctype, "strict"})do
    ~S(<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">)
  end

  defp render_token({:html, :doctype, "frameset"})do
    ~S(<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">)
  end

  defp render_token({:html, :doctype, "transitional"})do
    ~S(<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">)
  end
end
