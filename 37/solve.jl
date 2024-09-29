function is_prime(n::Int)
  if n < 2
    return false
  end

  if n > 2 && n % 2 == 0
    return false
  end

  for x in 2:floor(Int, sqrt(n))
    if n % x == 0
      return false
    end
  end

  return true
end

function is_truncatable_prime(n::Int)
  if !is_prime(n)
    return false
  end

  is_p = true
  len = length(string(n))
  for i in 1:len-1
    # 左
    if !is_prime(parse(Int, string(n)[1+i:end]))
      is_p = false
      break
    end
    # 右
    if !is_prime(parse(Int, string(n)[1:len-i]))
      is_p = false
      break
    end
  end

  return is_p
end

  # for i in 1:len-1
  #   # 左
  #   println("right: " * string(n)[1+i:end])
  #   # 右
  #   println("left: " * string(n)[1:len-i])
  # end

function solve()
  sum = 0
  for i in 11:10000000
    if is_truncatable_prime(i)
      println(i)
      sum += i
    end
  end

  return sum
end

println(solve())
