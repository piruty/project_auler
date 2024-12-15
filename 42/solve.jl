function istrianglenumber(n::Number)::Bool
  for i in 1:n
    if i * (i+1) / 2 == n
      return true
    end
  end
  return false
end

function str2index(s::Char)::Int
  return Int(s) - Int('A') + 1
end

function word2number(word::String)::Int
  return reduce(+, [str2index(s) for s in word])
end

function readfile(filename::String)::Vector{String}
  content = read(filename, String)
  content = replace(content, "\"" => "")
  return split(content, ",")
end

function solve()
  words = readfile("42/words.txt")
  count = 0
  for word in words
    num = word2number(word)
    if istrianglenumber(num)
      count += 1
    end
  end
  return count
end

# println(istrianglenumber(54))
# println(word2number("SKY"))
# println(readfile("42/words.txt"))
println(solve())


