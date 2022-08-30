local gravity = {}

function gravity.sort(array)
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

return gravity