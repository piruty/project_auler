module Utils

function perms(arr)
  n = length(arr)
  result = Vector{Int}[]
  push!(result, copy(arr))

  c = ones(Int, n)
  i = 1

  while i < n + 1
    if c[i] < i
      if i % 2 == 1
        arr[1], arr[i] = arr[i], arr[1]
      else
        arr[c[i]], arr[i] = arr[i], arr[c[i]]
      end
      push!(result, copy(arr))
      c[i] += 1
      i = 1
    else
      c[i] = 1
      i += 1
    end
  end
  return result
end

function primes(max::Int, min::Int = 2)
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

export perms
export primes
export is_prime
export prime_factors
end
