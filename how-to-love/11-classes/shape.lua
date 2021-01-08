--! shape.lua

Shape = Object:extend()

function Shape:new(x, y)
	self.x = x
	self.y = y
	self.speed = 100
end

function Shape:udpate(dt)
	self.x = self.x + self.speed * dt
end

