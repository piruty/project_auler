include("../Primes.jl")
using .Primes
using Combinatorics

# function solve(n)
#     primes = Primes.primes(10^(n - 1))
#     combs = []
#     for i in 1:n
#       append!(combs, primes)
#     end
#     combs = collect(multiset_combinations(combs, n))

#     # 素数をかけ合わせた数字の配列をつくる
#     products = []
#     for comb in combs
#       push!(products, prod(comb))
#     end

#     sort!(products)

#     # 配列の中から、n個順番に並んだものを見つけて、これらの数字を出力する
#     result = []
#     for i in 1:length(products)
#       if length(result) == 0
#         push!(result, products[i])
#         continue
#       end

#       if products[i] - result[end] == 1
#         push!(result, products[i])
#       else
#         result = []
#       end

#       if length(result) == n
#         return result
#       end
#     end

#     return []
# end

function solve(n)
  result = []

  for i in 10:100000000
    factors = Primes.prime_factors(i)

    # println(i, factors, unique(factors), length(unique(factors)))
    if length(unique(factors)) == n
      if length(result) == 0
        push!(result, i)
        continue
      end

      if i - result[end] == 1
        push!(result, i)
      else
        result = []
      end

      if length(result) == n
        return result
      end
    else
      result = []
    end
  end

  return []
end

println(solve(4))