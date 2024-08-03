def fibo(n, memo = {})
  return n if n <= 2

  memo[n] ||= fibo(n-1, memo) + fibo(n-2, memo)  # メモ化を利用
end

def even_fibo_sum(limit)
  sum = 0
  n = 1
  while (f = fibo(n)) <= limit  # フィボナッチ数が限界値を超えるまでループ
    sum += f if f.even?          # 偶数の場合のみ加算
    n += 1
  end
  sum
end

limit = ARGV[0].to_i.nonzero? || 4000000  # コマンドライン引数、またはデフォルトの4000000
puts even_fibo_sum(limit)

