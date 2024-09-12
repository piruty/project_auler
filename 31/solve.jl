function count_coin_combinations(target_amount::Int, coins::Vector{Int})
  combinations = zeros(Int, target_amount + 1)

  combinations[1] = 1

  for coin in coins
    for amount in coin:target_amount
      combinations[amount + 1] += combinations[amount - coin + 1]
    end
  end

  return combinations[end]
end

function main()
  coins = [1, 2, 5, 10, 20, 50, 100, 200]
  target_amount = 200
  println(count_coin_combinations(target_amount, coins))
end

main()
