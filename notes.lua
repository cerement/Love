-- notes

-- 1 functions

local function foo() ... end

-- is syntactic sugar for

local foo; foo = function() ... end


-- 2 passing 'self'

world:update(dt)

-- is a shortcut for

world.update(world, dt)


-- 3 tables

point = { x = 10, y = 20 }   -- Create new table
print(point["x"])            -- Prints 10
print(point.x)               -- Has exactly the same meaning as line above.
                             -- The easier-to-read dot notation is just syntactic sugar.
