--! world.lua

--[[
local begin_contact_counter = 0
local end_contact_counter = 0
local pre_solve_counter = 0
local post_solve_counter = 0
]]

local begin_contact_callback = function(fixture_a, fixture_b, contact)
  local name_a = fixture_a:getUserData()
  local name_b = fixture_b:getUserData()

  print(name_a, name_b, contact, 'beginning contact')
end

local end_contact_callback = function(fixture_a, fixture_b, contact)
  local name_a = fixture_a:getUserData()
  local name_b = fixture_b:getUserData()

  print(name_a, name_b, contact, 'ending contact')
end

local pre_solve_callback = function(fixture_a, fixture_b, contact)
  local name_a = fixture_a:getUserData()
  local name_b = fixture_b:getUserData()

  print(name_a, name_b, contact, 'about to resolve a contact')
end

local post_solve_callback = function(fixture_a, fixture_b, contact)
  local name_a = fixture_a:getUserData()
  local name_b = fixture_b:getUserData()

  print(name_a, name_b, contact, 'just resolved a contact')
end

local world = love.physics.newWorld(0, 9.81 * 128)

world:setCallbacks(
  begin_contact_callback,
  end_contact_callback,
  pre_solve_callback,
  post_solve_callback
)

return world
