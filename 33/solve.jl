function solve()
  bunshi = 1
  bunbo = 1
  for a in 11:99
    if a % 10 == 0
      continue
    end
    for b in a+1:99
      if b % 10 == 0
        continue
      end

      common_digits = collect(Set(string(a) ∩ string(b)))
      if length(common_digits) != 1
        continue
      end
      _a = replace(string(a), common_digits[1] => "")
      if _a == ""
        continue
      end
      _a = parse(Int, _a)

      _b = replace(string(b), common_digits[1] => "")
      if _b == ""
        continue
      end
      _b = parse(Int, _b)

      if _a == 0 || _b == 0
        continue
      end

      if a / b == _a / _b
        println("a: $a, b: $b")
        println("gcd: ", gcd(a, b))
        bunshi *= a
        bunbo *= b
      end
    end
  end

  println(bunbo / gcd(bunshi, bunbo))
end

solve()
