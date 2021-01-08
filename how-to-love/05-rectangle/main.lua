--! main.lua

-- alternate form love.load = function()
funtion love.load()
	x = 100
	y= 100
end

function love.update(dt)
	if love.keyboard.isDown("right") then
		-- print(dt)
		x = x + 100 * dt
	elseif love.keyboard.isDown("left") then
		x = x - 100 * dt
	elseif love.keyboard.isDown("down") then
		y = y + 100 * dt
	elseif love.keyboard.isDown("up") then
		y = y - 100 * dt
	end
end

function love.draw()
	love.graphics.rectangle("line", x, y, 200, 150)
end

