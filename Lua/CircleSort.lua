local circle = {}

function circle.sort(array)
    local function innerCircle(list, low, high, swaps)
		if low == high then
			return swaps
		end

		local subHigh, subLow = high, low
		local mid = math.floor((high - low) / 2)

		while low < high do
			if list[low] > list[high] then
				list[low], list[high] = list[high], list[low]
				swaps = swaps + 1
			end

			low = low + 1
			high = high - 1
		end

		if low == high then
			if list[low] > list[high + 1] then
				list[low], list[high + 1] = list[high + 1], list[low]
				swaps = swaps + 1
			end
		end

		swaps = innerCircle(list, subLow, subLow + mid, swaps)
		swaps = innerCircle(list, subLow + mid + 1, subHigh, swaps)

		return swaps
	end

    while innerCircle(array, 1, #array, 0) > 0 do end

	return array
end

return circle