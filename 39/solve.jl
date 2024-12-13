function solve(p)
  count = 0
  for a in 1:p
    for b in a+1:p
      c = p - a - b
      if c < b
        continue
      end

      if a*a + b*b == c*c
        count += 1
      end
    end
  end

  return count
end

# println(solve(120))
function s()
  maxc = 0
  maxp = 0
  for p in 1:1000
    c = solve(p)
    if maxc < c
      maxc = c
      maxp = p
    end
  end
  return maxp
end
println(s())
