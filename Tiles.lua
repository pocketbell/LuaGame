local Tile = require("Tile")

Tiles = {}

Tiles.Head = Tile.new({x = 50, y = 50, w = 50, h = 50})
Tiles.Body = {}
Tiles.BodyCount = 0


Tiles.UpdateMovement = function()
    Tiles.Head:MoveTile()
    if Tiles.BodyCount > 0 then
        for i = Tiles.BodyCount, 1, -1 do
            --Tiles.Body[i][1]:MoveTile()
        end
    end
end


Tiles.AddBody = function()
    Tiles.BodyCount = Tiles.BodyCount + 1
    Tiles.Body[Tiles.BodyCount] = {}
    --{Tiles.Head.x, Tiles.Head.y, 50, 50}
    Tiles.Body[Tiles.BodyCount][1] = Tile.new({ 
        x = Tiles.Head.x, 
        y = Tiles.Head.y,
        w = 50,
        h = 50})
end

Tiles.DrawBody = function()
    Tiles.Head:draw()
    if Tiles.BodyCount > 0 then
        for i = Tiles.BodyCount, 1, -1 do
            Tiles.Body[i][1]:draw()
        end
    end
end

return Tiles