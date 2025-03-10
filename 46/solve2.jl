include("../Primes.jl")
using .Primes

function solve()
  MAX = 10^6
  primes = Primes.primes(MAX)
  sq_list = [i * i * 2 for i in 1:sqrt(MAX)]
  for odd in 9:2:MAX
    if odd in primes
      continue
    end

    found = true

    for sq in sq_list
      if sq >= odd
        break
      end

      if odd - sq in primes
        found = false
        break
      end
    end

    if found
      println(odd)
      break
    end
  end
end

solve()