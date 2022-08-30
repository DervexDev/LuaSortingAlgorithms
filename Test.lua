local Algorithms = require 'Lua.AllAlgorithms'

local ARRAY_SIZE = 10 -- Length of an array
local ARRAY_RANDOM = true -- If set to false array (before sorting) will be in the opposite direction to the sorting goal
local ALGORITHM = 'all' -- 'all' to test every algorithm, 'name' to test specific algorithm (use short name e.g. 'radix')

local function makeArray()
    local array = {}

    for i = ARRAY_SIZE, 1, -1 do
        table.insert(array, i)
    end

	if ARRAY_RANDOM then
        math.randomseed(os.time())
		for i = #array, 1, -1 do
			local random = math.random(i)
			array[i], array[random] = array[random], array[i]
		end
	end

    return array
end

local function arrayToString(array)
    local output = ''

    for _, v in ipairs(array) do
        output = output..tostring(v)..', '
    end

    return output
end

local function printResult(algorithm)
    local array = makeArray()
    array = Algorithms[algorithm](array)

    print('\n'..'Sorted array with '..algorithm:gsub("^%l", string.upper)..' Sort:')
    print(arrayToString(array))
end

local function main()
    ALGORITHM = ALGORITHM:lower()

    if ALGORITHM ~= 'all' then
        printResult(ALGORITHM)
        print('')
    else
        --printResult('bogo') guess why?
        printResult('bubble')
        printResult('bucket')
        printResult('circle')
        printResult('cocktail')
        printResult('comb')
        printResult('counting')
        printResult('cycle')
        printResult('gnome')
        printResult('gravity')
        printResult('heap')
        printResult('insertion')
        printResult('merge')
        printResult('pancake')
        printResult('pigeonhole')
        printResult('quick')
        printResult('radix')
        printResult('selection')
        printResult('shell')
        printResult('stooge')
        printResult('strand')
        print('')
    end
end

main()