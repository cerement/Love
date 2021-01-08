--! player.lua

Player = Entity:extend()

function Player:new(x, y)
	Player.super.new(self, x, y, "player.png")
	self.strength = 10
end

function Player:update(dt)
	Player.super.update(self, dt)
	
	if love.keyboard.isDown("a") then
		self.x = self.x - 200 * dt
	elseif love.keyboard.isDown("d") then
		self.x = self.x + 200 * dt
	end
	if love.keyboard.isDown("w") then
		self.y = self.y - 200 * dt
	elseif love.keyboard.isDown("s") then
		self.y = self.y + 200 * dt
	end
end

