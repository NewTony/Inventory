--connection of necessary modules
local Inventory = require 'modules.inventory'
local Food = require 'modules.staff.food'

--connection of necessary libraries
local Pprint = require 'lib.pprint'

Pprint(Inventory)
Pprint(Food)

local health = 10
local fatigue = 5
local copyInventory

Inventory.items = Food.items

print('health = ' .. tostring(health))
print('fatigue = ' .. tostring(fatigue))

for k, v in pairs(Inventory.items) do
	if type(v) == 'table' then
		for key, value in pairs(v) do
			if type(value) == 'table' then
				for key2, value2 in pairs(value) do
					print(key .. ' = ' .. tostring(key2) .. ' : ' .. tostring(value2))
					if key == 'receive' then
						if key2 == 'health' then health = health + value2 end
						if key2 == 'fatigue' then fatigue = fatigue + value2 end
					end
				end
			else print(tostring(key) .. ' : ' .. tostring(value)) end
		end
	else print(tostring(k) .. ' : ' .. tostring(v)) end
end

local function deepcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[deepcopy(orig_key)] = deepcopy(orig_value)
		end
		setmetatable(copy, deepcopy(getmetatable(orig)))
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

print(Inventory)
copyInventory = deepcopy(Inventory)
print(copyInventory)

Pprint(Inventory)
Pprint(copyInventory)

print('health = ' .. tostring(health))
print('fatigue = ' .. tostring(fatigue))
