include("../Primes.jl")
using .Primes

function primes()
  ans = []
  for i in 1:1000
    if Primes.is_prime(i)
      append!(ans, i)
    end
  end
  return ans
end

function odd_composite_numbers()
  ans = []
  for i in 3:1000
    if i % 2 == 0
      continue
    end
    if Primes.is_prime(i)
      continue
    end
    append!(ans, i)
  end
  return ans
end

function numbers()
  ans = []
  ps = primes()
  for p in ps
    for i in 1:100000000
      append!(ans, p + 2 * i^2)
    end
  end
  unique!(sort!(ans))
  return ans
end

function solve()
  nums = numbers()
  odd_composite_numbers = odd_composite_numbers()
  println(length(odd_composite_numbers))
  for i in odd_composite_numbers
    if i in nums
      continue
    end
    println(i)
    break
  end
end

solve()