#Single-quoted string contains only printable characters
defmodule Stringy do
  def printable?([]) do
    true
  end

  def printable?( [head|tail] ) do
    if(is_printable?(head)) do
      printable?(tail)
    else
      false
    end
  end

  def is_printable?(c) do
    c >= 32 && c <126
  end
end
