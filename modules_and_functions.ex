# Modules and functions-1
# Modules and functions-3

defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: Times.double(n) * Times.double(n)
end

# Modules and functions-2
# Compile the module calling iex or using iex>c "filename.ex"

# Modules and functions-4
# Modules and functions-5

defmodule RaMath do
  def sum(x) do
    _sum(0,x)
  end

  defp _sum(acc,x) do
    case x do
      0 -> acc
      x -> _sum(acc+x, x-1)
    end
  end


  def gcd(x,0) do
    x
  end
  def gcd(x,y) do
    gcd(y,rem(x,y))
  end

end

# Moudles and functions -6

defmodule Chop do
  def _guess(num, min..max,guess_number) when guess_number == num do
    IO.puts("Is it #{guess_number}")
    num
  end
  def _guess(num, min..max, guess_number) when num < guess_number do
    IO.puts("Is it #{guess_number}")
    _guess(num,min..guess_number, div(min+guess_number,2) )
  end
  def _guess(num, min..max, guess_number) when num > guess_number do
    IO.puts("Is it #{guess_number}")
    _guess(num,guess_number..max, div(max+guess_number,2) )
  end
  def guess(num, min..max) do
     _guess(num, min..max, div(max,2))
  end
end



