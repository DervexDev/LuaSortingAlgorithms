local radix = {}

function radix.sort(array)
	local function counting(exp)
		local n = #array
		local output = table.create(n, 0)
		local count = table.create(10, 0)

		for i = 1, n do
			local index = math.floor(array[i] / exp)
			count[index % 10 + 1] += 1
		end

		for i = 2, 10 do
			count[i] += count[i - 1]
		end

		local i = n
		while i >= 1 do
			local index = math.floor(array[i] / exp)
			output[count[index % 10 + 1]] = array[i]
			count[index % 10 + 1] -= 1
			i -= 1
		end

		for j = 1, n do
			array[j] = output[j]
		end
	end

	local max = math.max(unpack(array))
	local exp = 1

	while max / exp >= 1 do
		counting(exp)
		exp *= 10
	end

	return array
end

return radix