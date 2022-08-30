local heap = {}

function heap.sort(array)
    local function heapify(size, i)
		local left = 2 * i
		local right = 2 * i + 1
		local largest

		if left <= size and array[left] > array[i] then
			largest = left
		else
			largest = i
		end

		if right <= size and array[right] > array[largest] then
			largest = right
		end

		if largest ~= i then
			array[i], array[largest] = array[largest], array[i]
			heapify(size, largest)
		end
	end

	local size = #array

	for i = math.floor(size / 2), 1, -1 do
		heapify(size, i)
	end

	for i = #array, 2, -1 do
		array[i], array[1] = array[1], array[i]
		size = size - 1
		heapify(size, 1)
	end

	return array
end

return heap