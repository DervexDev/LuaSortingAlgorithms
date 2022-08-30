local comb = {}

function comb.sort(array)
    local function getNextGap(gap)
		gap = math.floor((gap * 10) / 13)

		if gap < 1 then
			return 1
		end

		return gap
	end

    local gap = #array
    local swapped = true

    while gap ~= 1 or swapped do
        gap = getNextGap(gap)
        swapped = false

        for i = 1, #array - gap do
            if array[i] > array[i + gap] then
                array[i], array[i + gap] = array[i + gap], array[i]
                swapped = true
            end
        end
    end

    return array
end

return comb