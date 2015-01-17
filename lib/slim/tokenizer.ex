defmodule Slim.Tokenizer do
  def tokenize(source) when is_binary(source) do
    source
    |> String.split(~r/\n/, trim: true)
    |> tokenize
  end

  def tokenize([]), do: []
  def tokenize([h|t]) do
    [tokenize_line(h) | tokenize(t)]
  end

  def tokenize_line(line = <<"doctype", rest::binary>>) do
    {:html, :doctype, String.strip(rest)}
  end
end
