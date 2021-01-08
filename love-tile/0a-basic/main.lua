--! main.lua

love.load = function()
	message = 'Hello from LOVE'
	local secret = 'This is a local string'
	myGlobalTable = {'My first element', 'My second element'}
end

love.draw = function()
	love.graphics.print(myGlobalTable[1], 100, 100)
	love.graphics.print(myGlobalTable[2], 100, 200)
end
