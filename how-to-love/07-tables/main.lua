--! main.lua

function love.load()
	fruits = {"apple", "banana"}
	print(#fruits)
	
	table.insert(fruits, "pear")
	print(#fruits)
	
	table.insert(fruits, "pineapple")
	
	table.remove(fruits, 2)
	
	fruits[1] = "tomato"
	
	-- for i=1,#fruits do
	for i,v in ipairs(fruits) do
		print(i, v)
	end
end

function love.draw()
	for i,frt in ipairs(fruits) do
		love.graphics.print(frt, 100, 100 + 50 * i)
	end
end

