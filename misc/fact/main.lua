--! main.lua

--[[
testing out function syntax

local function foo() ... end

  is syntactic sugar for

local foo; foo = function() ... end

]]

-- A

-- needs variable declaration first
local fact = {}

fact = function(n)
  if n == 0 then
    return 1
  else
    return n * fact(n - 1) -- without declaration, error! fact is not defined
  end
end


-- B
--[[
local function fact(n)
  if n == 0 then
    return 1
  else
    return n * fact(n - 1)
  end
end
]]

print(fact(5))
