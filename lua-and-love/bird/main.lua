--! main.lua

------------------------------------------------------------------------

love.load = function()

  playingAreaWidth = 300
  playingAreaHeight = 388

  birdX = 62
  birdWidth = 30
  birdHeight = 25

  pipeSpaceHeight = 100
  pipeWidth = 54

  newPipeSpaceY = function()
    local pipeSpaceYMin = 54
    local pipeSpaceY = love.math.random(
      pipeSpaceYMin,
      playingAreaHeight - pipeSpaceHeight - pipeSpaceYMin
    )
    return pipeSpaceY
  end

  reset = function()
    birdY = 200
    birdYSpeed = 0

    pipe1X = playingAreaWidth
    pipe1SpaceY = newPipeSpaceY()

    pipe2X = playingAreaWidth + ((playingAreaWidth + pipeWidth) / 2)
    pipe2SpaceY = newPipeSpaceY()

    score = 0
    upcomingPipe = 1
  end

  reset()

end

------------------------------------------------------------------------

function love.update(dt)

  birdYSpeed = birdYSpeed + (516 * dt)
  birdY = birdY + (birdYSpeed * dt)

  local movePipe = function(pipeX, pipeSpaceY)
    pipeX = pipeX - (60 * dt)

    if (pipeX + pipeWidth) < 0 then
      pipeX = playingAreaWidth
      pipeSpaceY = newPipeSpaceY()
    end

    return pipeX, pipeSpaceY
  end

  pipe1X, pipe1SpaceY = movePipe(pipe1X, pipe1SpaceY)
  pipe2X, pipe2SpaceY = movePipe(pipe2X, pipe2SpaceY)

  isBirdCollidingWithPipe = function(pipeX, pipeSpaceY)
           -- left edge of bird to left of right edge of pipe
    return birdX < (pipeX + pipeWidth)
           -- right edge of bird to right of left edge of pipe
           and (birdX + birdWidth) > pipeX
           -- top edge of bird above bottom edge of upper pipe
           and (birdY < pipeSpaceY
           -- bottom edge of bird below top edge of lower pipe
           or (birdY + birdHeight) > (pipeSpaceY + pipeSpaceHeight))
  end

  if isBirdCollidingWithPipe(pipe1X, pipe1SpaceY)
    or isBirdCollidingWithPipe(pipe2X, pipe2SpaceY)
    or birdY > playingAreaHeight then
      reset()
  end

  local updateScoreAndClosestPipe = function(thisPipe, pipeX, otherPipe)
    if upcomingPipe == thisPipe
      and (birdX > (pipeX + pipeWidth)) then
        score = score + 1
        upcomingPipe = otherPipe
    end
  end

  updateScoreAndClosestPipe(1, pipe1X, 2)
  updateScoreAndClosestPipe(2, pipe2X, 1)

end

------------------------------------------------------------------------

love.keypressed = function(key)

  if birdY > 0 then
    birdYSpeed = -165
  end

end

------------------------------------------------------------------------

love.draw = function()

  -- background
  love.graphics.setColor(0.14, 0.36, 0.46, 1.0)
  love.graphics.rectangle('fill', 0, 0, playingAreaWidth, playingAreaHeight)

  -- bird
  love.graphics.setColor(0.87, 0.84, 0.27, 1.0)
  love.graphics.rectangle('fill', birdX, birdY, birdWidth, birdHeight)

  -- pipes
  local drawPipe = function(pipeX, pipeSpaceY)
    love.graphics.setColor(0.37, 0.82, 0.28, 1.0)
    love.graphics.rectangle(
      'fill',
      pipeX,
      0,
      pipeWidth,
      pipeSpaceY
    )
    love.graphics.rectangle(
      'fill',
      pipeX,
      pipeSpaceY + pipeSpaceHeight,
      pipeWidth,
      playingAreaHeight - pipeSpaceY - pipeSpaceHeight
    )
  end

  drawPipe(pipe1X, pipe1SpaceY)
  drawPipe(pipe2X, pipe2SpaceY)

  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
  love.graphics.print(score, 15, 15)

end
