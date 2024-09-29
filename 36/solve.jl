function is_palindrome(n)
    return n == reverse(n)
end

function solve(limit::Int)
  result = 0
  for n in 1:limit
    # println(n, ":", string(n, base=2))
    if !is_palindrome(string(n)) || !is_palindrome(string(n, base=2))
      continue
    end
    result += n
  end

  return result
end

println(solve(1000000))
