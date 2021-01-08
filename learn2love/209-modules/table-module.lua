--! table-module.lua

local my_cool_table = {}
my_cool_table.print_stuff = function()
  love.graphics.print('This function came from table-module.lua', 100, 200, 0, 2)
end

return my_cool_table
