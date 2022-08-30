local cocktail = {}

function cocktail.sort(array)
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

return cocktail