using Combinatorics

function solve()
  count = 0
  answer = []
  arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, '*', '=']
  for perm in permutations(arr)
    if perm[1] == '*' || perm[end] == '*' || perm[1] == '=' || perm[end] == '='
      continue
    end
    mulindex = findfirst(x -> x == '*', perm)
    eqindex = findfirst(x -> x == '=', perm)
    if mulindex > eqindex || eqindex - mulindex == 1
      continue
    end

    a = parse(Int, join(perm[1:mulindex-1]))
    b = parse(Int, join(perm[mulindex+1:eqindex-1]))
    c = parse(Int, join(perm[eqindex+1:end]))

    if Set([a, b, c]) in answer
      continue
    end

    push!(answer, Set([a, b, c]))

    if a * b == c
      count += 1
    end
  end

  return count
end

println(solve())
