--! main.lua

require 'map-functions'

------------------------------------------------------------------------

love.load = function()

  loadMap('maps/chez-porter.lua')

end

------------------------------------------------------------------------

love.draw = function()

  drawMap()

end
