
#Single-quoted string contains only printable characters
#center - print centered string StringsAndBinaries-5
#capitalize sentences. StringAndBinaries-6
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
 
  def center(list) when is_list(list) do
    larger = larger_string(list,0)
    print_centered(list,larger)
  end

  defp larger_string([],longer) , do: longer 
  defp larger_string([head|tail], longer) do
    if(String.length(head) > longer) do
      larger_string(tail,String.length(head)) 
    else
      larger_string(tail,longer) 
    end
  end

  defp print_centered([],_) do :ok  end 
  defp print_centered([head|tail], length) do
    head
    |> String.pad_leading( div(length-String.length(head) , 2)+String.length(head) ," " )
    |> IO.puts  
    print_centered(tail,length)
  end

  def capitalize_sentences(string) do
    string
    |> String.split(". ")
    |> Enum.filter(&String.length(&1)>0)
    |> Enum.map(&String.capitalize(&1)<>". ")
    |> List.to_string
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
