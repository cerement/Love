--! main.lua

function love.load()
	lume = require "lume"

	player1 = {
		x = 100,
		y = 100,
		size = 25,
		image = love.graphics.newImage("face.png")
	}
	
	player2 = {
		x = 300,
		y = 100,
		size = 25,
		image = love.graphics.newImage("face.png")
	}
		
--[[
	shakeDuration  = 0
	shakeWait = 0
	shakeOffset = {x = 0, y = 0}
]]
	
	coins = {}
	
	for i = 1, 25 do
		table.insert(coins,
			{
				x = love.math.random(50, 650),
				y = love.math.random(50, 450),
				size = 10,
				image = love.graphics.newImage("dollar.png")
			}
		)
	end
	
	score1 = 0
	score2 = 0
	
	screenCanvas = love.graphics.newCanvas(400, 600)
end

function love.update(dt)
	if love.keyboard.isDown("a") then
		player1.x = player1.x - 200 * dt
	elseif love.keyboard.isDown("d") then
		player1.x = player1.x + 200 * dt
	end
	if love.keyboard.isDown("w") then
		player1.y = player1.y - 200 * dt
	elseif love.keyboard.isDown("s") then
		player1.y = player1.y + 200 * dt
	end
	
	if love.keyboard.isDown("l") then
		player2.x = player2.x - 200 * dt
	elseif love.keyboard.isDown("'") then
		player2.x = player2.x + 200 * dt
	end
	if love.keyboard.isDown("p") then
		player2.y = player2.y - 200 * dt
	elseif love.keyboard.isDown(";") then
		player2.y = player2.y + 200 * dt
	end

	for i = #coins, 1, -1 do
		if checkCollision(player1, coins[i]) then
			table.remove(coins, i)
			player1.size = player1.size +1
			score1 = score1 + 1
--			shakeDuration = 0.3
		elseif checkCollision(player2, coins[i]) then
			table.remove(coins, i)
			player2.size = player2.size + 1
			score2 = score2 + 1
		end
	end
	
--[[
	if shakeDuration > 0 then
		shakeDuration = shakeDuration - dt
		if shakeWait > 0 then
			shakeWait = shakeWait - dt
		else
			shakeOffset.x = love.math.random(-5, 5)
			shakeOffset.y = love.math.random(-5, 5)
			shakeWait = 0.05
		end
	end
]]

end

function love.draw()
	love.graphics.setCanvas(screenCanvas)
	love.graphics.clear()
	drawGame(player1)
	love.graphics.setCanvas()
	love.graphics.draw(screenCanvas)
	
	love.graphics.setCanvas(screenCanvas)
	love.graphics.clear()
	drawGame(player2)
	love.graphics.setCanvas()
	love.graphics.draw(screenCanvas, 400)
	
	love.graphics.line(400, 0, 400, 600)
		
	love.graphics.print("Player 1 - " .. score1, 10, 10)
	love.graphics.print("Player 2 - " .. score2, 10, 30)
end

function checkCollision(p1, p2) 
    local distance = math.sqrt((p1.x - p2.x)^2 + (p1.y - p2.y)^2)
    return distance < p1.size + p2.size
end

function drawGame(focus)
	love.graphics.push() -- make a copy of current graphics position
		love.graphics.translate(-focus.x + 200, -focus.y + 300)
		
--[[
		if shakeDuration> 0 then
			love.graphics.translate(shakeOffset.x, shakeOffset.y)
		end
]]
		
		love.graphics.circle("line", player1.x, player1.y, player1.size)
		love.graphics.draw(player1.image, player1.x, player1.y,
			0, 1, 1, player1.image:getWidth()/2, player1.image:getHeight()/2)
	
		love.graphics.circle("line", player2.x, player2.y, player2.size)
		love.graphics.draw(player2.image, player2.x, player2.y,
			0, 1, 1, player2.image:getWidth()/2, player2.image:getHeight()/2)
	
		for i,v in ipairs(coins) do
			love.graphics.circle("line", v.x, v.y, v.size)
			love.graphics.draw(v.image, v.x, v.y,
				0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
		end
	
	love.graphics.pop() -- pull copy of current state
end

--[[
function saveGame()
	data = {}
	
	data.player = {
		x = player.x,
		y = player.y,
		size = player.size
	}
	
	data.coins = {}
	for i,v in ipairs(coins) do
		data.coins[i] = {x = v.x, y = v.y }
	end
	
	serialized = lume.serialize(data)
	love.filesystem.write("savedata.txt", serialized)
end

function love.keypressed(key)
	if key == "f1" then
		saveGame()
	elseif key == "f2" then
		love.filesystem.remove("savedata.txt")
		love.event.quit("restart")
	end
end
]]

