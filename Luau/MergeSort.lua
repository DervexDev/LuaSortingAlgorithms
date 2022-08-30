local merge = {}

function merge.sort(array)
	local function mergeSort(low, mid, high)
		local n1 = mid - low + 1
		local n2 = high - mid
		local left = {}
        local right = {}

		for i = 1, n1 do
			left[i] = array[low + i - 1]
		end
		left[n1 + 1] = math.huge

		for j = 1, n2 do
			right[j] = array[mid + j]
		end
		right[n2 + 1] = math.huge

		local i = 1
		local j = 1

		for k = low, high do
			if left[i] <= right[j] then
				array[k] = left[i]
				i += 1
			else
				array[k] = right[j]
				j += 1
			end
		end
	end

	local function sort(low, high)
		if low < high then
			local mid = math.floor((low + high) / 2)
			sort(low, mid)
			sort(mid + 1, high)
			mergeSort(low, mid, high)
		end

		return array
	end

	return sort(1, #array)
end

return merge