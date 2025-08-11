local Tiles = require("Tiles")
local Food = require("Food")

function love.load()
  
end

function love.update(dt)
  Tiles:UpdateMovement()
  if Tiles.CheckCollision(Tiles.Head, Food) then
    Tiles.CalculateAddBody(Food.Value)
    Food.x = love.math.random(0, 500)
    Food.y = love.math.random(0, 500)
  end
  Tiles.CalculateReduceBody()
end

function love.draw()
  Tiles:DrawBody()
  Food:Draw()
end