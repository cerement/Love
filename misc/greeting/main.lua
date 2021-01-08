--! main.lua

greet = {"hello", "hi", "bonjour"}
greeting = {}

for _, v in ipairs(greet) do
  greeting[v] = function(n)
    print(v .. ", " .. n)
  end
end

greeting.hello("world")
greeting.hi("there")
greeting.bonjour("le monde")
