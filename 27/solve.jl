include("../PrimeModule.jl")
using .PrimeModule

# 与えられたa, bに対して連続する整数の数を数える関数
function count_consecutive_primes(a::Int, b::Int)::Int
    n = 0
    while is_prime(n^2 + a*n + b)
        n += 1
    end
    return n
end

function find_quadratic_coefficients()
  max_primes = 0
  max_a = 0
  max_b = 0

  for a in -999:999
    for b in -1000:1000
      primes = count_consecutive_primes(a, b)
      if primes > max_primes
        max_primes = primes
        max_a = a
        max_b = b
      end
    end
  end

  return max_a, max_b, max_primes
end

a, b, primes = find_quadratic_coefficients()
println("最長の素数列を生成する二次式の係数:")
println("a = $a")
println("b = $b")
println("連続する素数の数: $primes")
println("係数の積: $(a * b)")
