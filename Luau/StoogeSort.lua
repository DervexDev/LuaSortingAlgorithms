local stooge = {}

function stooge.sort(array)
	local function sort(low, high)
		if low >= high then
			return
		end

		if array[low] > array[high] then
			array[low], array[high] = array[high], array[low]
		end

		if high - low > 1 then
			local part = math.floor((high - low + 1) / 3)
			sort(low, high - part)
			sort(low + part, high)
			sort(low, high - part)
		end

		return array
	end

	return sort(1, #array)
end

return stooge