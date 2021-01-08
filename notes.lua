-- notes

-- 1 functions

local function foo() ... end

-- is syntactic sugar for

local foo; foo = function() ... end


-- 2 passing 'self'

world:update(dt)

-- is a shortcut for

world.update(world, dt)
