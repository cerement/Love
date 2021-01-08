--! main.lua

function love.load()
	-- myImage = love.graphics.newImage("path/to/sheep.png")
	myImage = love.graphics.newImage("sheep.png")
	width = myImage:getWidth()
	height = myImage:getHeight()
	
	love.graphics.setBackgroundColor(1, 1, 1)
end

function love.draw()
	-- object, x, y, rotate, scalex, scaley, offsetx, offsety, shearx, sheary
	love.graphics.setColor(255/255, 200/255, 40/255, 127/255)
	love.graphics.draw(myImage, 100, 100)
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(myImage, 200, 100)
end

