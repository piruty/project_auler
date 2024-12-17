include("../Permutations.jl")
using .Permutations

function isdivisible(perm::Vector{Int})::Bool
  if parse(Int, join(perm[2:4])) % 2 != 0
    return false
  end
  if parse(Int, join(perm[3:5])) % 3 != 0
    return false
  end
  if parse(Int, join(perm[4:6])) % 5 != 0
    return false
  end
  if parse(Int, join(perm[5:7])) % 7 != 0
    return false
  end
  if parse(Int, join(perm[6:8])) % 11 != 0
    return false
  end
  if parse(Int, join(perm[7:9])) % 13 != 0
    return false
  end
  if parse(Int, join(perm[8:10])) % 17 != 0
    return false
  end
  return true
end

function solve()
  perms = Permutations.perms(collect(0:9))
  result =  0

  for perm in perms
    if isdivisible(perm)
      result += parse(Int, join(perm))
    end
  end
  return result
end

# println(isdivisible([1,4,0,6,3,5,7,2,8,9]))
println(solve())
