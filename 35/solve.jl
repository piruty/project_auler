using Combinatorics

function is_prime(n::Int)
  if n < 2
    return false
  end

  if n > 2 && n % 2 == 0
    return false
  end

  for x in 2:floor(Int, sqrt(n))
    if n % x == 0
      return false
    end
  end

  return true
end

function solve(limit::Int)
  count = 0
  primes = Set{Int}()
  not_primes = Set{Int}()

  for i in 2:limit
    clear = true
    for j in 1:length(string(i))
      n = parse(Int, string(i)[j:end] * string(i)[1:j-1])
      if n in primes
        continue
      end
      if n in not_primes
        clear = false
        break
      end

      if is_prime(n)
        push!(primes, n)
        continue
      else
        push!(not_primes, n)
        clear = false
        break
      end
    end

    if clear
      count += 1
    end
  end

  # println(primes)
  return count
end

# print(solve(100))
print(solve(1000000))
