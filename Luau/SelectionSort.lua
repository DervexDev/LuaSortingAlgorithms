local selection = {}

function selection.sort(array)
	for i = 1, #array do
		local min = i

		for j = i + 1, #array do
			if array[min] > array[j] then
				min = j
			end
		end

		array[i], array[min] = array[min], array[i]
	end

	return array
end

return selection