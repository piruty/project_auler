function solve(p)
  count = 0
  for a in 1..p
    for b in a+1..p
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

puts solve(120)
