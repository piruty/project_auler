function solve()::Integer
  numbers = []
  for p in 1:10000000
    append!(numbers, reverse(digits(p)))
    if size(numbers)[1] > 1000000
      break
    end
  end
  return numbers[1] * numbers[10] * numbers[100] * numbers[1000] * numbers[10000] * numbers[100000] * numbers[1000000]

end

println(solve())
