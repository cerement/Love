--! entities/boundary.lua

local world = require('world')

return function(x_pos, y_pos, horiz_vert)
  local window_width, window_height = love.window.getMode()
  local size = {}
  if horiz_vert == 'horiz' then
    size.width = window_width
    size.height = 10
  elseif horiz_vert == 'vert' then
    size.width = 10
    size.height = window_height
  end

  local entity = {}
  entity.body = love.physics.newBody(world, x_pos, y_pos, 'static')
  entity.shape = love.physics.newRectangleShape(size.width, size.height)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
  entity.fixture:setUserData(entity)

  return entity
end
