local bucket = {}

function bucket.sort(array)
	local function insertion(subArray)
		for i = 2, #subArray do
			local key = subArray[i]
			local j = i - 1

			while j > 0 and key < subArray[j] do
				subArray[j + 1] = subArray[j]
				j -= 1
			end

			subArray[j + 1] = key
		end

		return subArray
	end

	local buckets = {}
	local slots = 10

	for i = 1, #array do
		array[i] /= #array * 1.1 -- to make algorithm work with integers
	end

	for i = 1, slots do
		table.insert(buckets, i, {})
	end

	for _, j in ipairs(array) do
		local index = math.ceil(slots * j)
		table.insert(buckets[index], j)
	end

	for i = 1, slots do
		buckets[i] = insertion(buckets[i])
	end

	local k = 1
	for i = 1, slots do
		for j = 1, #buckets[i] do
			array[k] = math.round(buckets[i][j] * (#array * 1.1)) -- to make algorithm work with integers
			k += 1
		end
	end

	return array
end

return bucket