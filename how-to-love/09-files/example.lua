--! example.lua

local test = 99
return test

--[[
local test = 20

function some_function(test)
	if true then
		local test = 40
		print(test)
		-- output: 40
	end
	print(test)
	-- output: 30
end

some_function(30)

print(test)
-- output: 20
]]

