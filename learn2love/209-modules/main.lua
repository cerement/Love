--! main.lua

local bar = require('entities/bar')
local triangle = require('entities/triangle')
local world = require('world')

local paused = false

local key_map = {
  escape = function()
    love.event.quit()
  end,
  space = function()
    paused = not paused
  end
}

love.draw = function()
  love.graphics.polygon('line', triangle.body:getWorldPoints(triangle.shape:getPoints()))
  love.graphics.polygon('line', bar.body:getWorldPoints(bar.shape:getPoints()))
end

love.focus = function(focused)
  if not focused then
    paused = true
  end
end

love.keypressed = function(pressed_key)
  if key_map[pressed_key] then
    key_map[pressed_key]()
  end
end

love.update = function(dt)
  if not paused then
    world:update(dt)
  end
end
