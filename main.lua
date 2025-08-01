local Tiles = require("Tiles")

function love.load()
  
end

function love.update()
  if love.keyboard.isDown("p") then
    Tiles.AddBody()
  end
  Tiles:UpdateMovement()
end

function love.draw()
  Tiles:DrawBody()
end