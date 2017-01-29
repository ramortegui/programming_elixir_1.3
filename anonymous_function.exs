# Sample of anonymous functions
# Functions-1
#

# Concatenate lists
list_concat = fn( a, b) ->
  a ++ b
end
result = list_concat.([:a,:b],[:c,:d])

IO.inspect(result)

# sum list
sum = fn(list) -> 
  Enum.reduce(list, 0, fn(x, acc) -> x + acc end )
end

IO.inspect(sum.([1,2,3]))

# pair tupe to list
pair_tuple_to_list = fn({a,b}) -> 
  [a,b]
end

IO.inspect(pair_tuple_to_list.({1234,5678}))



# Functions-2
#
#fizz-buzz

fizz_buzz = fn
  (0,0,_) -> "Fizz Buzz"
  (0,_,_) -> "Fizz"
  (_,0,_) -> "Buzz"
  (_,_,c) -> c
end

IO.inspect(fizz_buzz.(0,0,1));
IO.inspect(fizz_buzz.(0,1,1));
IO.inspect(fizz_buzz.(1,0,1));
IO.inspect(fizz_buzz.(1,1,1));


# Functions - 3

check_fizz_buzz = fn(x) -> 
  fizz_buzz.(rem(x,3),rem(x,5),x)
end

Enum.each(10..16, &( IO.puts(check_fizz_buzz.(&1)) ))
