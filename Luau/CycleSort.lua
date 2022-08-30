local cycle = {}

function cycle.sort(array)
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

return cycle