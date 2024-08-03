### A Pluto.jl notebook ###
# v0.19.45

using Markdown
using InteractiveUtils

# ╔═╡ f0b7e284-5167-11ef-115e-61145d8b97ba
md"# 非過剰数の総和を求める"

# ╔═╡ 9d345519-73a3-4378-a1a8-94882156917a
md"## 1. 過剰数のリストを作る"

# ╔═╡ 3b6fd948-7d54-460f-8f49-29aa8de526db
function make_divisors(N)
	divisors = Int[]
	for i in 1:floor(Int, sqrt(N))
		if N % i == 0
			push!(divisors, i)
			if i != div(N, i) && div(N, i) != N
				push!(divisors, div(N, i))
			end
		end
	end
	return divisors
end

# ╔═╡ a28ebc89-7180-41ef-895f-bfc3dc2d4d10
function sum_divisors(N)
	divs = make_divisors(N)
	sum_divs = sum(divs)

	return sum_divs
end

# ╔═╡ 978c2f1c-3070-41e0-a5b4-6f8d994c31e2
println(sum_divisors(12))

# ╔═╡ 7dc8132d-e250-4bfd-bb99-d1e72f626487
function is_kajosu(N)
	return N < sum_divisors(N)
end

# ╔═╡ 8c720882-d4a9-4aff-bdd3-cdf7505d8e22
println(is_kajosu(12))

# ╔═╡ 5283da5b-b192-4e64-abeb-8246ebf19a07
begin
	kajosus = []

	for i in 1:28124
		if is_kajosu(i)
			push!(kajosus, i)
		end
	end
end

# ╔═╡ 705f9372-11d3-4277-b92a-4b00ff2e7822


# ╔═╡ 6bcea029-0c87-41cc-a4b1-2bb1207aa8e6
kajosus

# ╔═╡ 1ab5e023-0682-43a6-bf5e-ccab02df1362
md"## 2. 2つの過剰数の和のリストを作る"

# ╔═╡ 9d1b6f2a-c9d9-4bbc-9d53-e5f4898dbab9
begin
	kajo_sums = [x + y for x in kajosus for y in kajosus]
	kajo_sums = unique(kajo_sums)
end

# ╔═╡ f8a09ebd-44d7-43e5-9a04-f7227cf04a66
kajo_sums

# ╔═╡ 0a1eb7b7-fdcf-4f73-a7ce-f8f2911c301f
md"## 3. 28123までの整数で２のリストに含まれないものの総和を求める"

# ╔═╡ a750ea84-4bfa-40b9-b005-a800b72ed315
begin
	result = 0
	not_kajo_sums = []
	for i in 1:28123
		if !(i in kajo_sums)
			result += i
			push!(not_kajo_sums, i)
		end
	end

	println(result)
end

# ╔═╡ Cell order:
# ╠═f0b7e284-5167-11ef-115e-61145d8b97ba
# ╠═9d345519-73a3-4378-a1a8-94882156917a
# ╠═3b6fd948-7d54-460f-8f49-29aa8de526db
# ╠═a28ebc89-7180-41ef-895f-bfc3dc2d4d10
# ╠═978c2f1c-3070-41e0-a5b4-6f8d994c31e2
# ╠═7dc8132d-e250-4bfd-bb99-d1e72f626487
# ╠═8c720882-d4a9-4aff-bdd3-cdf7505d8e22
# ╠═5283da5b-b192-4e64-abeb-8246ebf19a07
# ╠═705f9372-11d3-4277-b92a-4b00ff2e7822
# ╠═6bcea029-0c87-41cc-a4b1-2bb1207aa8e6
# ╠═1ab5e023-0682-43a6-bf5e-ccab02df1362
# ╠═9d1b6f2a-c9d9-4bbc-9d53-e5f4898dbab9
# ╠═f8a09ebd-44d7-43e5-9a04-f7227cf04a66
# ╠═0a1eb7b7-fdcf-4f73-a7ce-f8f2911c301f
# ╠═a750ea84-4bfa-40b9-b005-a800b72ed315
