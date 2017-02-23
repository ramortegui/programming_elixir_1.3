defmodule FizzBuzz do
  def check(num) do
    _fizz_buzz({ rem(num,3),rem(num,5),num })
  end

  defp _fizz_buzz(tuple) do
    case tuple do
      {0,0,_} -> "Fizz Buzz"
      {0,_,_} -> "Fizz"
      {_,0,_} -> "Buzz"
      {_,_,c} -> c
    end 
  end
end
