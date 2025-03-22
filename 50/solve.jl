include("../Utils.jl")
using .Utils

function solve(n)
  # 素数のリストを作成する
  primes = Utils.primes(n)

  # 部分和を計算する
  cumsum_primes = cumsum(primes)
  max_len = 0
  max_sum = 0
  for i in 1:length(cumsum_primes)
    for j in i+1:length(cumsum_primes)
      tmp = cumsum_primes[j] - cumsum_primes[i]
      if tmp < n && Utils.is_prime(tmp) && j - i > max_len
        max_sum = max(max_sum, tmp)
        max_len = max(max_len, j - i)
      end
    end
  end
  println(max_len, ":", max_sum)
end

function cumsum(arr)
  answer = [0]
  for a in arr
    tmp = length(answer) == 0 ? 0 : answer[end]
    push!(answer, tmp + a)
  end
  return answer
end

solve(1000000)