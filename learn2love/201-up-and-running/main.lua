--! main.lua

--[[
love.draw = function()
  love.graphics.print('Hello world!', 400, 300)
end
]]

local number = 0

love.draw = function()
  number = number + 1
  love.graphics.print(number, 400, 300)
end
