module Permutations

function perms(arr)
  n = length(arr)
  result = Vector{Int}[]
  push!(result, copy(arr))

  c = ones(Int, n)
  i = 1

  while i < n + 1
    if c[i] < i
      if i % 2 == 1
        arr[1], arr[i] = arr[i], arr[1]
      else
        arr[c[i]], arr[i] = arr[i], arr[c[i]]
      end
      push!(result, copy(arr))
      c[i] += 1
      i = 1
    else
      c[i] = 1
      i += 1
    end
  end
  return result
end

export perms

end
