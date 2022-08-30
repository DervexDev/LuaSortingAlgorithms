local shell = {}

function shell.sort(array)
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

return shell