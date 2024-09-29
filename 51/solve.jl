include("../PrimeModule.jl")

function r(n, positions)
  cnt = 0
  for i in 0:9
    digits = collect(string(n))

    for pos in positions
      if pos == 0
        continue
      end

      digits[pos] = Char(i + 48)
    end

    num = parse(Int, join(digits))
    if PrimeModule.is_prime(num)
      # println(num)
      cnt += 1
    end
  end

  return cnt
end

function solve()
  for i in 10000:99999
    for a in [0, 1]
      for b in [0, 2]
        for c in [0, 3]
          for d in [0, 4]
            for e in [0, 5]
              positions = [a, b, c, d, e]
              if count(x -> x != 0, positions) >= 4
                continue
              end

              # println(positions)
              if r(i, positions) == 7
                println(i)
                return
              end
            end
          end
        end
      end
    end
  end
end

solve()
# println(r(56003, [0, 0, 3, 4, 0]))
