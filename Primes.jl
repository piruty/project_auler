module Primes

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

export is_prime

end
