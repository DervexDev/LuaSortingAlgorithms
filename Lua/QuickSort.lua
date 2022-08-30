local quick = {}

function quick.sort(array)
    local function partition(low, high)
		local pivot = array[high]
		local i = low - 1

		for j = low, high - 1 do
			if array[j] <= pivot then
				i = i + 1
				array[i], array[j] = array[j], array[i]
			end
		end

		array[i + 1], array[high] = array[high], array[i + 1]

		return i + 1
	end

	local function sort(low, high)
		if low < high then
			local pivot = partition(low, high)
			sort(low, pivot - 1)
			sort(pivot + 1, high)
		end

        return array
	end

	return sort(1, #array)
end

return quick