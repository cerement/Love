--! main.lua

love.draw = function()
  -- love.graphics.polygon('line', 50, 0, 0, 100, 100, 100)

  local rectangle = {100, 100, 100, 200, 200, 200, 200, 100}
  love.graphics.polygon('line', rectangle)
end
