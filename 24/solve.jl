function solve()
  count = 0
  for a in 0:9
    for b in 0:9
      used = [a]
      if b in used
        continue
      end
      for c in 0:9
        used = [a, b]
        if c in used
          continue
        else
          used = [a, b, c]
        end
        for d in 0:9
          used = [a, b, c]
          if d in used
            continue
          else
          end
          for e in 0:9
            used = [a, b, c, d]
            if e in used
              continue
            else
            end
            for f in 0:9
              used = [a, b, c, d, e]
              if f in used
                continue
              else
              end
              for g in 0:9
                used = [a, b, c, d, e, f]
                if g in used
                  continue
                else
                end
                for h in 0:9
                  used = [a, b, c, d, e, f, g]
                  if h in used
                    continue
                  else
                  end
                  for i in 0:9
                    used = [a, b, c, d, e, f, g, h]
                    if i in used
                      continue
                    else
                    end
                    for j in 0:9
                      used = [a, b, c, d, e, f, g, h, i]
                      if j in used
                        continue
                      end
                      count += 1
                      # println("count = ", count)
                      if count == 1000000
                        println(a, b, c, d, e, f, g, h, i, j)
                        # println("a = ", a)
                        # println("b = ", b)
                        # println("c = ", c)
                        # println("d = ", d)
                        # println("e = ", e)
                        # println("f = ", f)
                        # println("g = ", g)
                        # println("h = ", h)
                        # println("i = ", i)
                        # println("j = ", j)
                        return
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

solve()
