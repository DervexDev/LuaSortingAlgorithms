local bogo = {}

function bogo.sort(array)
	local function isSorted()
		for i = 2, #array do
			if array[i - 1] > array[i] then
				return false
			end
		end

		return true
	end

	local function shuffle()
		for i = 1, #array do
			local random = math.random(1, #array)
			array[i], array[random] = array[random], array[i]
		end
	end

	while not isSorted() do
		shuffle()
	end

	return array
end

return bogo