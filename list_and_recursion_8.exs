tax_rates = [ NC: 0.0075, TX: 0.08 ]
orders = [
 [id: 123, ship_to: :NC, net_amount: 100.00],
 [id: 124, ship_to: :OK, net_amount: 35.00],
 [id: 125, ship_to: :TX, net_amount: 24.00],
 [id: 126, ship_to: :TX, net_amount: 44.00],
 [id: 127, ship_to: :NC, net_amount: 25.00],
 [id: 128, ship_to: :MA, net_amount: 10.00],
 [id: 129, ship_to: :CA, net_amount: 102.00],
 [id: 130, ship_to: :NC, net_amount: 50.00] ]


combination = fn(order,tax_rates) ->  
  if(tax_rates[order[:ship_to]]) do
    order ++ [ total_amount: ( order[:net_amount] + ( tax_rates[order[:ship_to]] * order[:net_amount] ))]
  else
    order ++ [ total_amount: order[:net_amount]]
  end
end

Enum.map(orders,&(combination.(&1,tax_rates)))
|> IO.inspect


