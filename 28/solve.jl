function solve(n::Int)
  sum = 1
  current =  1

  # ((n - 1) / 2) is the number of layers in the spiral
  # n: size of the spiral
  # n - 1: size of the spiral minus the center
  # (n - 1) / 2: number of layers in the spiral
  for layer in 1:((n - 1) / 2)
    step = 2 * layer # step is the distance between the corners of the layer
    for _ in 1:4 # there are 4 corners in a layer
      current += step
      sum += current
    end
  end

  return sum
end
