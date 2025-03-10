function is_natural_number(N)::Bool
  return isinteger(N) && N > 0
end

nT(T::Int) = (-1 + sqrt(1 + 8T)) / 2.0
nP(P::Int) = (1 + sqrt(1 + 24P)) / 6.0
nH(H::Int) = (1 + sqrt(1 + 8H)) / 4.0

function solve()
  for T in 40756:10000000000000
    if !is_natural_number(nT(T))
      continue
    end
    if !is_natural_number(nP(T))
      continue
    end
    if !is_natural_number(nH(T))
      continue
    end

    println(T)
    break
  end
end

solve()