local algorithms = {}

function algorithms.bogo(array)
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

function algorithms.bubble(array)
    for i = 1, #array do
		for j = 1, #array - i do
			if array[j] > array[j + 1] then
				array[j], array[j + 1] = array[j + 1], array[j]
			end
		end
	end

    return array
end

function algorithms.bucket(array)
    local function insertion(subArray)
		for i = 2, #subArray do
			local key = subArray[i]
			local j = i - 1

			while j > 0 and key < subArray[j] do
				subArray[j + 1] = subArray[j]
				j = j - 1
			end

			subArray[j + 1] = key
		end

		return subArray
	end

    local buckets = {}
    local slots = 10

    for i = 1, #array do
		array[i] = array[i] / (#array * 1.1) -- to make algorithm work with integers
	end

    for i = 1, slots do
        table.insert(buckets, i, {})
    end

    for _, j in ipairs(array) do
        local index = math.ceil(slots * j)
        table.insert(buckets[index], j)
    end

    for i = 1, slots do
        buckets[i] = insertion(buckets[i])
    end

    local k = 1
    for i = 1, slots do
        for j = 1, #buckets[i] do
            array[k] = math.ceil(buckets[i][j] * (#array * 1.1)) -- to make algorithm work with integers
            k = k + 1
        end
    end

	return array
end

function algorithms.circle(array)
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

function algorithms.cocktail(array)
    local swapped

    repeat
        swapped = false

        for i = 1, #array - 1 do
            if array[i] > array[i + 1] then
                array[i], array[i + 1] = array[i + 1], array[i]
                swapped = true
            end
        end

        if not swapped then
            break
        end

        for i = #array - 1, 1, -1 do
            if array[i] > array[i + 1] then
                array[i], array[i + 1] = array[i + 1], array[i]
                swapped = true
            end
        end
    until swapped == false

    return array
end

function algorithms.comb(array)
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

function algorithms.counting(array)
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

function algorithms.cycle(array)
    local start = 0

    while start < #array - 1 do
        local value = array[start + 1]

        local position = start
        local i = start + 1

        while i < #array do
            if array[i + 1] < value then
                position = position + 1
            end

            i = i + 1
        end

        if position ~= start then
            while value == array[position + 1] do
                position = position + 1
            end

            array[position + 1], value = value, array[position + 1]

            while position ~= start do
                position = start
                i = start + 1

                while i < #array do
                    if array[i + 1] < value then
                        position = position + 1
                    end

                    i = i + 1
                end

                while value == array[position + 1] do
                    position = position + 1
                end

                array[position + 1], value = value, array[position + 1]
            end
        end

        start = start + 1
    end

    return array
end

function algorithms.gnome(array)
    local i, j = 2, 3

    while i <= #array do
        if array[i-1] <= array[i] then
            i = j
            j = j + 1
        else
            array[i - 1], array[i] = array[i], array[i - 1]
            i = i - 1

            if i == 1 then
                i = j
                j = j + 1
            end
        end
    end

    return array
end

function algorithms.gravity(array)
    local tally = {}

    for j = #array, 1, -1 do
        for i = 1, array[j] do
            if tally[i] then
                tally[i] = tally[i] - 1
            else
                tally[i] = #array
            end
        end
    end

    return tally
end

function algorithms.heap(array)
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

function algorithms.insertion(array)
    for i = 2, #array do
		local key = array[i]
		local j = i - 1

		while j > 0 and key < array[j] do
			array[j + 1] = array[j]
			j = j - 1
		end

		array[j + 1] = key
	end

    return array
end

function algorithms.merge(array)
    local function mergeSort(low, mid, high)
		local n1 = mid - low + 1
		local n2 = high - mid
		local left = {}
        local right = {}

		for i = 1, n1 do
			left[i] = array[low + i - 1]
		end
		left[n1 + 1] = math.huge

		for j = 1, n2 do
			right[j] = array[mid + j]
		end
		right[n2 + 1] = math.huge

		local i = 1
		local j = 1

		for k = low, high do
			if left[i] <= right[j] then
				array[k] = left[i]
				i = i + 1
			else
				array[k] = right[j]
				j = j + 1
			end
		end
	end

	local function sort(low, high)
		if low < high then
			local mid = math.floor((low + high) / 2)
			sort(low, mid)
			sort(mid + 1, high)
			mergeSort(low, mid, high)
		end

        return array
	end

    return sort(1, #array)
end

function algorithms.pancake(array)
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

function algorithms.pigeonhole(array)
    local holes = {}

    for i = 1, #array do
        holes[i] = 0
    end

    for _, v in ipairs(array) do
        holes[v] = holes[v] + 1
    end

    local i = 1
    for count = 1, #array do
        while holes[count] > 0 do
            holes[count] = holes[count] - 1
            array[i] = count
            i = i + 1
        end
    end

    return array
end

function algorithms.quick(array)
    local function partition(low, high)
		local pivot = array[high]
		local i = low - 1

		for j = low, high - 1 do
			if array[j] <= pivot then
				i = i + 1
				array[i], array[j] = array[j], array[i]
			end
		end

		array[i + 1], array[high] = array[high], array[i + 1]

		return i + 1
	end

	local function sort(low, high)
		if low < high then
			local pivot = partition(low, high)
			sort(low, pivot - 1)
			sort(pivot + 1, high)
		end

        return array
	end

	return sort(1, #array)
end

function algorithms.radix(array)
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

function algorithms.selection(array)
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

function algorithms.shell(array)
    local gap = math.floor(#array / 2)

    while gap > 0 do
        local j = gap

        while j < #array do
            local i = j - gap

            while i >= 0 do
                if array[i + gap + 1] > array[i + 1] then
                    break
                else
                    array[i + gap + 1], array[i + 1] = array[i + 1], array[i + gap + 1]
                end

                i = i - gap
            end

            j = j + 1
        end

        gap = math.floor(gap / 2)
    end

	return array
end

function algorithms.stooge(array)
    local function sort(low, high)
		if low >= high then
			return
		end

		if array[low] > array[high] then
			array[low], array[high] = array[high], array[low]
		end

		if high - low > 1 then
			local part = math.floor((high - low + 1) / 3)
			sort(low, high - part)
			sort(low + part, high)
			sort(low, high - part)
		end

        return array
	end

	return sort(1, #array)
end

function algorithms.strand(array)
    local function merge(a, b)
		local output = {}
		while #a > 0 and #b > 0 do
			if a[1] < b[1] then
				table.insert(output, table.remove(a, 1))
			else
				table.insert(output, table.remove(b, 1))
			end
		end

		for _, v in ipairs(a) do
			table.insert(output, v)
		end

		for _, v in ipairs(b) do
			table.insert(output, v)
		end

		return output
	end

	local function strandSort()
		local item = 1
		local sub = {table.remove(array, 1)}

		while item < #array do
			if array[item] > sub[#sub] then
				table.insert(sub, table.remove(array, item))
			else
				item = item + 1
			end
		end

		return sub
	end

    local output = strandSort()

    while #array > 0 do
        output = merge(output, strandSort())
    end

    return output
end

return algorithms