local Tiles = require("Tiles")
local Food = require("Food")

function love.load()
  
end

function love.update()
  if love.keyboard.isDown("p") then
    Tiles.AddBody()
  end
  Tiles:UpdateMovement()
  if Tiles.Head.x > Food.x - Food.w and Tiles.Head.x < Food.x + Food.w and Tiles.Head.y > Food.y - Food.h and Tiles.Head.y < Food.y + Food.h then
        Food.x = love.math.random(0, 500)
        Food.y = love.math.random(0, 500)
      Tiles.AddBody()
  end
end

function love.draw()
  Tiles:DrawBody()
  Food:Draw()
end