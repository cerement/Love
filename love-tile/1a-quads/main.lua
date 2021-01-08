--! main.lua

love.load = function()

  tileset = love.graphics.newImage('countryside.png')

  tileW, tileH = 32, 32
  local tilesetW, tilesetH = tileset:getWidth(), tileset:getHeight()

  local quadInfo = {
    { ' ',  0,  0 }, -- 1 grass
    { '#', 32,  0 }, -- 2 box
    { '*',  0, 32 }, -- 3 flowers
    { '^', 32, 32 }  -- 4 box top
  }

  quads = {}
  for _, info in ipairs(quadInfo) do
    quads[info[1]] = love.graphics.newQuad(info[2], info[3], tileW, tileH, tilesetW, tilesetH)
  end

  local tileString = [[
^#######################^
^                    *  ^
^  *                    ^
^              *        ^
^                       ^
^    ##  ^##  ^## ^ ^   ^
^   ^  ^ ^  ^ ^   ^ ^   ^
^   ^  ^ ^ *# ^   ^ ^   ^
^   ^  ^ ^##  ^## # #   ^
^   ^  ^ ^  ^ ^    ^  * ^
^ * ^  ^ ^  ^ ^    ^    ^
^   #  # ^* # ^  * ^    ^
^    ##  ###  ###  #    ^
^                       ^
^   *****************   ^
^                       ^
^  *                  * ^
#########################
]]

  tileTable = {}

  local width = #(tileString:match('[^\n]+'))

  for x = 1, width, 1 do tileTable[x] = {} end

  local rowIndex, columnIndex = 1, 1

  for row in tileString:gmatch('[^\n]+') do
    assert(#row == width, 'Map is not aligned: width of row ' .. tostring(rowIndex)
      .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
    columnIndex = 1
    for character in row:gmatch('.') do
      tileTable[columnIndex][rowIndex] = character
      columnIndex = columnIndex + 1
    end
    rowIndex = rowIndex + 1
  end

end

love.draw = function()

  for columnIndex, column in ipairs(tileTable) do
    for rowIndex, char in ipairs(column) do
      local x, y = (columnIndex - 1) * tileW, (rowIndex - 1) * tileH
      love.graphics.draw(tileset, quads[char], x, y)
    end
  end

end
