--! main.lua

function love.load()
	x = 30
	y = 30
end

function love.draw()
	love.graphics.rectangle("line", x, y, 100, 100)
end

function love.keypressed(key)
	if key == "space" then
		x = math.random(100, 500)
		y = math.random(100, 500)
	end
end

--[[
function love.load()
	tick = require "tick"
	
	drawRectangle = false
	
	-- first argument is a function
	-- second argument is time in seconds
	-- set drawRectangle to true after 2 seconds
	tick.delay(function() drawRectangle = true end, 2)
end

function love.update(dt)
	tick.update(dt)
end

function love.draw()
	if drawRectangle then
		love.graphics.rectangle("fill", 100, 100, 300, 200)
	end
end
]]

