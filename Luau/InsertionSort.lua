local insertion = {}

function insertion.sort(array)
	for i = 2, #array do
		local key = array[i]
		local j = i - 1

		while j > 0 and key < array[j] do
			array[j + 1] = array[j]
			j -= 1
		end

		array[j + 1] = key
	end

	return array
end

return insertion