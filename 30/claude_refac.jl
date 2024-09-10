const POWER = 5
const UPPER_LIMIT = 1_000_000

function digit_power_sum(num::Int, power_dict::Dict{Int, Int})
  return sum(power_dict[digit] for digit in digits(num))
end

function find_digit_power_numbers(power::Int, limit::Int)
  power_dict = Dict(d => d^power for d in 0:9)
  valid_numbers = Int[]

  for num in 2:limit
    if num == digit_power_sum(num, power_dict)
      push!(valid_numbers, num)
    end
  end

  return valid_numbers
end

function main()
  valid_numbers = find_digit_power_numbers(POWER, UPPER_LIMIT)
  println("numbers: ", valid_numbers)
  println("sum: ", sum(valid_numbers))
end

main()
