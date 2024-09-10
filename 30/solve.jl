function make_dict()
  dict = Dict()
  for i = 0:9
    dict[i] = i^5
  end
  return dict
end

function is_same(num::Int, dict)
  sum = 0
  for i = 1:length(string(num))
    sum += dict[parse(Int, string(num)[i])]
  end
  return sum == num
end

function main()
  sum = 0
  dict = make_dict()
  for i = 2:1000000
    if is_same(i, dict)
      println(i)
      sum += i
    end
  end
  println(sum)
end

main()


