function number_to_set(n::Int)
  return Set(parse(Int, i) for i in string(n))
end

function pandigital(n::Int)
  pandigits = ""
  for i in 1:9
    pandigits *= string(n * i)

    if contains(pandigits, "0")
      return -1
    end

    if length(pandigits) > 9
      return -1
    end

    if length(pandigits) == 9
      break
    end
  end

  if length(number_to_set(parse(Int, pandigits))) == 9
    return parse(Int, pandigits)
  else
    return -1
  end
end

function solve()
  max = 0

  for i in 2:1000000
    p = pandigital(i)
    if p > max
      max = p
    end
  end

  return max
end

println(solve())
# println(pandigital(192))
