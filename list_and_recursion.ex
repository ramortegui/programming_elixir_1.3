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
#Write a span funciton ListAndRecurson-4
#Write Enum funcitons with no library or list comprehensions ListAndRecursion-5
#Write flatten function ListAndRecursion-6
#Write primes function LIstAndRecursion-7
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

  def span( from, to) do
    span( from, to, [])
  end
  defp span(from, to, list) when from == to do
   list ++ [from]
  end
  defp span(from, to, list) do
    span( from+1, to, list ++ [from] )
  end

  def all?([]) do
    true
  end

  def all?([head|_]) when is_nil(head) do
    false
  end

  def all?([_|tail]) do
    all? tail
  end

  def each( list, fun ) do
    _each( list, fun, [] )
  end
  defp _each( [], _ , list ) do
    list
  end
  defp _each([head|tail],fun,list) do
    _each(tail, fun, list ++ [fun.(head)] )
  end

  def filter(list,fun) do
    _filter(list, fun,[])
  end
  defp _filter([], _, list) do
    list
  end
  defp _filter([head|tail], fun, list) do
    if(fun.(head)) do
      _filter(tail, fun, list++[head])
    else
      _filter(tail, fun, list)
    end
  end

  def take(list, n) do
    _take(list,n,[])
  end
  defp _take(_, n, acc) when n == 0 do
    acc
  end
  defp _take([head|tail],n,acc) do
    _take(tail,n-1,acc++[head])
  end

  def split(list,n) do
    _split(list,n,[])
  end
  defp _split([], _, acc) do
    {[],acc}
  end
  defp _split([head |tail] , n, acc) when head == n do
    {acc++[head], tail}
  end
  defp _split([head|tail], n, acc) do
    _split(tail,n,acc++[head])
  end

  def flatten([]) do
    []
  end
  def flatten([head|tail]) when is_list(head) do
    flatten(head)++flatten(tail)
  end
  def flatten([head|tail]) do
    [head]++flatten(tail)
  end

  def primes(n) when n > 1 do
    for x <- span(2,n), is_prime?(x), do: x
  end
  defp is_prime?(n) when n <= 3 and n > 1, do: true

  defp is_prime?(n) when n >= 2 do
    num = span(2,div(n,2))
    factors = for x <- num, rem(n,x) == 0,do: x 
    case factors do
      [] -> true
      [_|_] -> false
    end
  end

end



