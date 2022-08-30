local gnome = {}

function gnome.sort(array)
	local i, j = 2, 3

	while i <= #array do
		if array[i-1] <= array[i] then
			i = j
			j += 1
		else
			array[i - 1], array[i] = array[i], array[i - 1]
			i -= 1

			if i == 1 then
				i = j
				j += 1
			end
		end
	end

	return array
end

return gnome