function solve()
  result = 0

  for i in 1:1000
    power = powermod(i, i, 10^10)
    result = (result + power) % 10^10
  end

  return result
end

println(solve())
