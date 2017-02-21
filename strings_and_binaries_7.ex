tax_rates = [ NC: 0.0075, TX: 0.08 ]
file_name = "./files/sales_tax.csv" 

{:ok, file} = File.open(file_name)
#Read heder
header = 
  IO.read(file,:line) 
  |> String.trim
  |> String.split(",")
  |> Enum.map(&(String.to_atom(&1)))
  
File.close(file)

transform = fn([id,city,amount]) ->
  Enum.zip(header, [String.to_integer(id), String.to_atom(city), String.to_float(amount)])
end

orders = File.stream!(file_name)
|> Enum.drop(1)
|> Enum.map(fn(x) -> 
    String.trim(x)
    |> String.split(",")
    |> transform.()
  end  
)

combination = fn(order,tax_rates) ->  
  if(tax_rates[order[:ship_to]]) do
    order ++ [ total_amount: ( order[:net_amount] + ( tax_rates[order[:ship_to]] * order[:net_amount] ))]
  else
    order ++ [ total_amount: order[:net_amount]]
  end
end

Enum.map(orders,&(combination.(&1,tax_rates)))
|> IO.inspect


