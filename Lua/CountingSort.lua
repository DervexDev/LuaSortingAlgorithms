local counting = {}

function counting.sort(array)
    local function getMax()
        local value = array[1]

        for i = 2, #array do
            if value < array[i] then
                value = array[i]
            end
        end

        return value
    end

	local k = getMax()
	local bucket = {}
	local count = {}

	for i = 0, k do
		count[i] = 0
	end

	for j = 1, #array do
		count[array[j]] = count[array[j]] + 1
	end

	for i = 1, k do
		count[i] = count[i] + count[i - 1]
	end

	for j = #array, 1, -1 do
		bucket[count[array[j]]] = array[j]
		count[array[j]] = count[array[j]] - 1
	end

	for i = 1, #array do
		array[i] = bucket[i]
	end

	return array
end

return counting