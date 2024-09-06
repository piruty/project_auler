function find_fibo_with_1000_digits()
  a, b = BigInt(1), BigInt(1)
  index = 2

  while ndigits(a) < 1000
    a, b = a + b, a
    index += 1
  end

  return index
end

result = find_fibo_with_1000_digits()
println(result)
