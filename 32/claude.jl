using Combinatorics

function is_pandigital(n::Int, digits::Int)
  used_digits = Set{Int}()
  while n > 0
    digit = n % 10
    if digit == 0 || digit > digits || digit in used_digits
      return false
    end
    push!(used_digits, digit)
    n ÷= 10
  end
  return length(used_digits) == digits
end

function is_pandigital_string(s::String)
  return length(s) == 9 && Set(s) == Set("123456789")
end

function find_pandigital_products()
  products = Set{Int}()

  for perm in permutations("123456789")
    for i in 1:7
      multiplicand = parse(Int, join(perm[1:i]))
      for j in i+1:8
        multiplier = parse(Int, join(perm[i+1:j]))
        product = multiplicand * multiplier

        all_digits = string(multiplicand, multiplier, product)
        if is_pandigital_string(all_digits)
          push!(products, product)
        end
      end
    end
  end

  return sum(products)
end

println(find_pandigital_products())
