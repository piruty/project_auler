function fact_dict()
    fact_dict = Dict{Int, BigInt}()
    fact_dict[0] = 1
    fact_dict[1] = 1
    for i in 2:9
        fact_dict[i] = BigInt(i) * fact_dict[i-1]
    end
    return fact_dict
end

function solve()
  result = 0
  d = fact_dict()

  for i in 10:2540160
    sum = 0
    for c in string(i)
      sum += d[parse(Int, c)]
    end
    if sum == i
      result += i
    end
  end

  return result
end

println(solve())
