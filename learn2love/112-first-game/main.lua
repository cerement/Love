--! main.lua

math.randomseed(os.time())
number = math.random(100)
guess_counter = 1

print("Guess my secret number. It is between 1 and 100.")

guess = tonumber(io.read())

while guess ~= number do
  guess_counter = guess_counter + 1
  if guess > number then
    print("Your guess is too high.")
  end
  if guess < number then
    print("Your guess is too low.")
  end

  print("Guess again:")
  guess = tonumber(io.read())
end

print("You guessed correctly! The number was " .. number .. ".")

if guess_counter <= 5 then
  print("Amazing! It only took you " .. guess_counter .. " tries.")
else
  print("It took you " .. guess_counter .. "tries. Not bad.")
end
