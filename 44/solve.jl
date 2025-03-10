function Pn(n)
  return n * (3 * n - 1) / 2
end

function Check(vec, i, j)
  add = vec[i] + vec[j]
  diff = abs(vec[i] - vec[j])

  return add in vec && diff in vec
end

function solve(n)
  vec = [Pn(n) for n in 1:n]

  for i in 1:n
    for j in i+1:n
      if Check(vec, i, j)
        println(BigInt(vec[i] - vec[j]))
      end
    end
  end
end

println(solve(10000))