function distinct_powers(a::Int, b::Int)::Int
    s = Set{BigInt}()
    for n in 2:a
        for m in 2:b
            push!(s, BigInt(n)^m)
        end
    end
    return length(s)
end

println(distinct_powers(100, 100))
