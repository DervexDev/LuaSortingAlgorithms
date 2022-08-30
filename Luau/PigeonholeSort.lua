local pigeonhole = {}

function pigeonhole.sort(array)
	local holes = table.create(#array, 0)

	for _, v in ipairs(array) do
		holes[v] += 1
	end

	local i = 1
	for count = 1, #array do
		while holes[count] > 0 do
			holes[count] -= 1
			array[i] = count
			i += 1
		end
	end

	return array
end

return pigeonhole