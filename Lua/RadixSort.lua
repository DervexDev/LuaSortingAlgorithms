local radix = {}

function radix.sort(array)
    local function counting(exp)
		local n = #array
        local output = {}
        local count = {}

        for i = 1, n do
            output[i] = 0
        end

        for i = 1, 10 do
            count[i] = 0
        end

		for i = 1, n do
			local index = math.floor(array[i] / exp)
			count[index % 10 + 1] = count[index % 10 + 1] + 1
		end

		for i = 2, 10 do
			count[i] = count[i] + count[i - 1]
		end

		local i = n
		while i >= 1 do
			local index = math.floor(array[i] / exp)
			output[count[index % 10 + 1]] = array[i]
			count[index % 10 + 1] = count[index % 10 + 1] - 1
			i = i - 1
		end

		for j = 1, n do
			array[j] = output[j]
		end
	end

    local function getMax()
        local value = array[1]

        for i = 2, #array do
            if value < array[i] then
                value = array[i]
            end
        end

        return value
    end

    local max = getMax()
    local exp = 1

    while max / exp >= 1 do
        counting(exp)
        exp = exp * 10
    end

	return array
end

return radix