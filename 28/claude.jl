function sum_spiral_diagonals(size::Int)
  if size % 2 == 0
    throw(ArgumentError("size must be odd"))
  end

  sum = 1
  current = 1

  for layer in 1:((size - 1) / 2)
    step = 2 * layer
    for _ in 1:4
      current += step
      sum += current
    end
  end

  return sum
end

println(sum_spiral_diagonals(5))
println(sum_spiral_diagonals(1001))
