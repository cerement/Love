--! main.lua

local current_color = {1, 1, 1, 1}
local seconds = 0

love.draw = function()
  local square = {100, 100, 100, 200, 200, 200, 200, 100}
  local clock_display = 'Seconds: ' .. seconds
  love.graphics.print(clock_display, 0, 0, 0, 2, 2)

  love.graphics.setColor(current_color)
  love.graphics.polygon('fill', square)
end

love.keypressed = function(pressed_key)
  if pressed_key == 'b' then
    current_color = {0, 0, 1, 1}
  elseif pressed_key == 'g' then
    current_color = {0, 1, 0, 1}
  elseif pressed_key == 'r' then
    current_color = {1, 0, 0, 1}
  elseif pressed_key == 'w' then
    current_color = {1, 1, 1, 1}
  end

  if pressed_key == 'escape' then
    love.event.quit()
  end
end

love.update = function(dt)
  seconds = seconds + dt
end
