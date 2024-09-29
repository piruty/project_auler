using Primes

# 数字の桁を置き換える関数
function replace_digits(n::Int, positions::Vector{Int}, digit::Int)
    digits = collect(string(n))
    for pos in positions
        digits[pos] = Char(digit + 48)
    end
    parse(Int, join(digits))
end

# 素数族を生成する関数
function generate_prime_family(prime::Int, positions::Vector{Int})
    family = Int[]
    for d in 0:9
        new_num = replace_digits(prime, positions, d)
        if length(string(new_num)) == length(string(prime)) && isprime(new_num)
            push!(family, new_num)
        end
    end
    family
end

# メイン関数
function find_smallest_prime_with_eight_member_family()
    prime = 2
    while true
        digits = collect(string(prime))
        n = length(digits)
        for r in 1:n-1
            for positions in combinations(1:n, r)
                family = generate_prime_family(prime, positions)
                if length(family) == 8
                    return minimum(family)
                end
            end
        end
        prime = nextprime(prime + 1)
    end
end

# 組み合わせを生成する関数
function combinations(arr, r)
    n = length(arr)
    if r > n
        return []
    end
    indices = collect(1:r)
    combinations = [arr[indices]]
    while true
        i = r
        while i >= 1 && indices[i] == n - r + i
            i -= 1
        end
        if i == 0
            break
        end
        indices[i] += 1
        for j in i+1:r
            indices[j] = indices[j-1] + 1
        end
        push!(combinations, arr[indices])
    end
    combinations
end

# 結果を計算
result = find_smallest_prime_with_eight_member_family()
println("8つの素数族を持つ最小の素数: ", result)
