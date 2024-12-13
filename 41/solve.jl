include("../Permutations.jl")
include("../Primes.jl")
using .Permutations
using .Primes

function solve(arr)::Number
  perms = Permutations.perms(arr)

  maxn = -Inf
  for perm in perms
    n = parse(Int, join(perm))

    if Primes.is_prime(n)
      if maxn < n
        maxn = n
      end
    end
  end

  return maxn
end

for n in 2:9
  println(solve(collect(1:n)))
end
