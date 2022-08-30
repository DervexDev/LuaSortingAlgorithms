local pigeonhole = {}

function pigeonhole.sort(array)
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

return pigeonhole