# 1 2 3 5 8 13 21 34 55 89, ...
$result = []
$memo = []

def fibo(n)
  if n == 1
    $result << 1
    return 1
  elsif n == 2
    $result << 2
    return 2
  else
    if $memo.include?(n)
      return $memo[n]
    else
      f = fibo(n-1) + fibo(n-2)
      $result << f
      $memo[n] = f
      return f
    end
  end
end

puts fibo(ARGV[0].to_i)
a = $result.uniq.sort.map do |i|
  if i % 2 != 0 or i > 4000000
    0
  else
    i
  end
end
puts a.inject(:+)
