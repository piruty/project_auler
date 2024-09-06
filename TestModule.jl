module TestModule

function add(a::Int, b::Int)::Int
  return a + b
end
export add

function sub(a::Int, b::Int)::Int
  return a - b
end

end

module TestModule2

function mul(a::Int, b::Int)::Int
  return a * b
end
export mul

end
