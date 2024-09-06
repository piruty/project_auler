# GPTに相談した辞書順に次の順列を求める関数
# https://chatgpt.com/share/2b9a0b70-dac0-4a29-b825-bbf7db4f559e
function next_permutations!(nums)
  n = length(nums)
  if n < 2
    return false
  end

  p = -1
  for i in n-1:-1:n-2
    if nums[i-1] < nums[i]
      p = i-1
      break
    end
  end

  if p == -1
    return false
  end

  for j in n:-1:p+2
    if nums[j] > nums[p]
      nums[p], nums[j] = nums[j], nums[p]
      break
    end
  end

  reverse!(nums, p+2:n)

  return true
end

function main()
  nums = collect(0:9)

  println(nums)

  while next_permutations!(nums)
    println(nums)
  end
end

main()
