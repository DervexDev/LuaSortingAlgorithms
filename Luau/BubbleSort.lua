local bubble = {}

function bubble.sort(array)
	for i = 1, #array do
		for j = 1, #array - i do
			if array[j] > array[j + 1] then
				array[j], array[j + 1] = array[j + 1], array[j]
			end
		end
	end

	return array
end

return bubble