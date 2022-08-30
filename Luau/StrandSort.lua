local strand = {}

function strand.sort(array)
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
				item += 1
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

return strand