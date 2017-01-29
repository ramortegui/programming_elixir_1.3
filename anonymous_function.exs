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
