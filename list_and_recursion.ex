#Write sum generic without tail_recursion LIstAndRecursion-0
defmodule ListRecursion do
  def sum([]) do
    0
  end
  def sum([head|tail]) do
    head+sum(tail)
  end
end


#Write a mapsum funciton ListAndRecursion-1
#Write a max(list) function ListAndRecursion-2
#Write a caesar function ListAndRecursion-3
defmodule MyList do
  def reduce([], value, _) do
    value
  end

  def reduce([head|tail], value, fun) do
    reduce(tail, fun.(head, value), fun)
  end

  def mapsum(list, fun ) do
    mapsum(list, 0, fun)
  end
  defp mapsum([], value, _)do
    value
  end
  defp mapsum([head|tail], value, fun) do
    mapsum(tail, value+fun.(head), fun)
  end

  def max([head|tail]) do
    maxp(tail, head)
  end
  defp maxp( [], max) do
    max
  end
  defp maxp([head|tail], max) when head >= max do
    maxp(tail, head)
  end
  defp maxp([head|tail], max) when head < max do
    maxp(tail, max)
  end


  def caesar(list, n) do
     _caesar(list,[],n) 
  end

  defp _caesar([], list, _ )do
    list
  end
  defp _caesar([head|tail], list, n) when head+n > 122 do
   _caesar(tail, list ++ [head+n-123+97] ,n)
  end
  defp _caesar([head|tail], list, n) when head+n <= 122 do
   _caesar(tail, list ++ [(head+n)] ,n)
  end
end
