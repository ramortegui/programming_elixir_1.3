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

end
