module Primes

function primes(max::Int)
  ans = []
  for i in 1:max
    if is_prime(i)
      append!(ans, i)
    end
  end
  return ans
end

function is_prime(n::Int)
  if n <= 1
    return false
  end
  for i in 2:isqrt(n)
    if n % i == 0
      return false
    end
  end
  return true
end

function prime_factors(n::Int)
  factors = Int[]
  while div(n, 2) == 0
    push!(factors, 2)
    n = div(n, 2)
  end

  for i in 2:isqrt(n)
    while n % i == 0
      push!(factors, i)
      n = div(n, i)
    end
  end

  if n > 1
    push!(factors, n)
  end

  return factors
end

export is_prime

end
