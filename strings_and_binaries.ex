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

  def anagram(stringa, stringb) do
    if String.length(stringa) == String.length(stringb) do
      _anagram(stringa,stringb)
    else
      false
    end
  end
  defp _anagram(stringa, stringb ) do
    Enum.sort(to_charlist("asdf"),&(&1<&2)) == Enum.sort(to_charlist("fdsa"),&(&1<&2))
  end
end

#Simple calculator StringsAndBinares-4
defmodule Calc do
  def calculate(string) do
    values = Regex.named_captures(~r/(?<num1>\d+)(?<op>[+|-|*|\/])(?<num2>\d+)/,string)
    calculate(values["op"],String.to_integer(values["num1"]),String.to_integer(values["num2"]))
  end
  def calculate("+",num1,num2) do
    num1 + num2
  end
  def calculate("-",num1,num2) do
    num1 - num2
  end
  def calculate("*",num1,num2) do
    num1 * num2
  end
  def calculate("/",num1,num2) do
    num1 / num2
  end
end
