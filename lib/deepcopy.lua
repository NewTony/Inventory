local deepcopy = {

	function deepcopy_f(orig)
		local orig_type = type(orig)
		local copy
		if orig_type == 'table' then
			copy = {}
			for orig_key, orig_value in next, orig, nil do
				copy[deepcopy_f(orig_key)] = deepcopy_f(orig_value)
			end
			setmetatable(copy, deepcopy_f(getmetatable(orig)))
		else -- number, string, boolean, etc
			copy = orig
		end
		return copy
	end
}

return deepcopy
