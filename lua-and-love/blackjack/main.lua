--! main.lua

love.load = function()

  deck = {}
  for suitIndex, suit in ipairs({'club', 'diamond', 'heart', 'spade'}) do
    for rank = 1, 13 do
      table.insert(deck, {suit = suit, rank = rank})
    end
  end

  takeCard = function(hand)
    table.insert(hand, table.remove(deck, love.math.random(#deck)))
  end

  playerHand = {}
  takeCard(playerHand)
  takeCard(playerHand)

  dealerHand = {}
  takeCard(dealerHand)
  takeCard(dealerHand)

  roundOver = false

  getTotal = function(hand)
    local total = 0
    local hasAce = false

    for cardIndex, card in ipairs(hand) do
      if card.rank > 10 then
        total = total + 10
      else
        total = total + card.rank
      end

      if card.rank == 1 then
        hasAce = true
      end
    end

    if hasAce and total <= 11 then
      total = total + 10
    end

    return total
  end

end

------------------------------------------------------------------------

love.draw = function()

  local output = {}

  table.insert(output, 'Player hand:')
  for cardIndex, card in ipairs(playerHand) do
    table.insert(output, 'suit: ' .. card.suit .. ', rank: ' .. card.rank)
  end

  table.insert(output, 'Total: ' .. getTotal(playerHand))

  table.insert(output, '')

  table.insert(output, 'Dealer hand:')
  for cardIndex, card in ipairs(dealerHand) do
    table.insert(output, 'suit: ' .. card.suit .. ', rank: ' .. card.rank)
  end

  table.insert(output, 'Total: ' .. getTotal(dealerHand))

  if roundOver then
    table.insert(output, '')

    local hasHandWon = function(thisHand, otherHand)
      return getTotal(thisHand) <= 21
      and (getTotal(otherHand) > 21
        or getTotal(thisHand) > getTotal(otherHand))
    end

    if hasHandWon(playerHand, dealerHand) then
      table.insert(output, 'Player wins')
    elseif hasHandWon(dealerHand, playerHand) then
      table.insert(output, 'Dealer wins')
    else
      table.insert(output, 'Draw')
    end

  end

  love.graphics.print(table.concat(output, '\n'), 15, 15)

end

------------------------------------------------------------------------

love.keypressed = function(key)

  if key == 'escape' then
    love.event.quit()
  elseif not roundOver then
    if key == 'h' then
      takeCard(playerHand)
      if getTotal(playerHand) >= 21 then
        roundOver = true
      end
    elseif key == 's' then
      roundOver = true
    end
  else
    love.load()
  end

end
