function solve()
  n = 1
  while true
    x1 = Set(string(n))
    x2 = Set(string(n * 2))
    x3 = Set(string(n * 3))
    x4 = Set(string(n * 4))
    x5 = Set(string(n * 5))
    x6 = Set(string(n * 6))
    if x1 == x2 == x3 == x4 == x5 == x6
      println(n)
      break
    end
    n += 1
  end
end

function digit_count(n)
  counts = zeros(Int, 10)
  for digit in string(n)
    counts[parse(Int, digit) + 1] += 1
  end
  return counts
end

function solve2()
  n = 1
  while true
    counts1 = digit_count(n)
    if all(i -> digit_count(n * i) == counts1, 2:6)
      println(n)
      break
    end
    n += 1
  end
end

solve()
solve2()