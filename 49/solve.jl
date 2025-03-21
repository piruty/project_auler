include("../Utils.jl")
using .Utils
using Combinatorics

function solve()
  primes = Utils.primes(9999, 1000)
  answers = String[]

  for p in primes
    num_array = to_a(p)

    num_array_perms = perms(num_array)
    num_array_primes = Int[]

    for num_array_perm in num_array_perms
      tmp = parse(Int, join(num_array_perm, ""))
      if tmp < 1000
        continue
      end
      if is_prime(tmp)
        push!(num_array_primes, tmp)
      end
    end

    if length(num_array_primes) < 3
      continue
    end

    sort!(num_array_primes)

    for comb in combinations(num_array_primes, 3)
      a, b, c = comb
      if a == b
        continue
      end
      if b - a == c - b
        push!(answers, join(comb, ""))
      end
    end
  end

  println(unique(answers))
end

function to_a(n::Int)
  digits = Int[]
  tmp = n
  while tmp > 0
    push!(digits, tmp % 10)
    tmp = div(tmp, 10)
  end
  return sort(digits)
end


solve()