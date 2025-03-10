#!/usr/bin/env julia

include("../Primes.jl")
using .Primes

"""
Project Euler 問題47: 異なる素因数を4つ持つ連続する4つの数

問題:
異なる素因数をちょうど2つ持つ連続する2つの数が初めて現れるのは:
14 = 2 × 7
15 = 3 × 5

異なる素因数をちょうど3つ持つ連続する3つの数が初めて現れるのは:
644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19

異なる素因数をちょうど4つ持つ連続する4つの数が初めて現れるのはいくつか?
"""

function count_distinct_prime_factors(n::Int)
    # 素因数分解して、異なる素因数の数を返す
    factors = Primes.prime_factors(n)
    return length(unique(factors))
end

function find_consecutive_numbers_with_n_distinct_prime_factors(consecutive_count::Int, distinct_factors::Int)
    n = 2  # 2から探索開始
    consecutive = 0
    
    while true
        if count_distinct_prime_factors(n) == distinct_factors
            consecutive += 1
            if consecutive == consecutive_count
                # 連続するconsecutive_count個の数が見つかった
                return n - consecutive_count + 1
            end
        else
            consecutive = 0
        end
        n += 1
    end
end

# 異なる素因数をちょうど4つ持つ連続する4つの数を探す
result = find_consecutive_numbers_with_n_distinct_prime_factors(4, 4)
println("異なる素因数をちょうど4つ持つ連続する4つの数が初めて現れるのは: $result") 