local pancake = {}

function pancake.sort(array)
    local function flip(i)
		local start = 1

		while start < i do
			array[i], array[start] = array[start], array[i]
			start = start + 1
			i = i - 1
		end
	end

	local function findMax(n)
		local max = 1

		for i = 1, n do
			if array[i] > array[max] then
				max = i
			end
		end

		return max
	end

    local size = #array

    while size > 1 do
        local max = findMax(size)

        if max ~= size then
            flip(max)
            flip(size)
        end

        size = size - 1
    end

    return array
end

return pancake