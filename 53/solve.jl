function solve()
  map = Dict{Int, BigInt}()
  count = 0
  for n in 1:100
    for r in 1:n
      if !haskey(map, n)
        map[n] = factorial(BigInt(n))
      end
      tmp_n = map[n]

      if !haskey(map, r)
        map[r] = factorial(BigInt(r))
      end
      tmp_r = map[r]

      if !haskey(map, n-r)
        map[n-r] = factorial(BigInt(n-r))
      end
      tmp_nr = map[n-r]

      if tmp_n ÷ (tmp_r * tmp_nr) > 1000000
        count += 1
      end
    end
  end
  println(count)
end

function solve2()
  count = 0
  for n in 1:100
    for r in 1:n
      if binomial(BigInt(n), BigInt(r)) > 1000000
        count += 1
      end
    end
  end
  println(count)
end

solve()