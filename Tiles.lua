local Tile = require("Tile")

Tiles = {}

Tiles.Head = Tile.new({x = 50, y = 50, w = 25, h = 25})
Tiles.Body = {}
Tiles.BodyCount = 0
Tiles.Speed = 1
Tiles.TrailSpeed = 1

Tiles.Trail = function(leader, trail, leadSpeed, trailSpeed)
    if trail.x > leader.x + leader.w then
        trail.x = trail.x - leadSpeed
        if trail.y > leader.y then
            trail.y = trail.y - trailSpeed
        elseif trail.y < Tiles.Head.y then
            trail.y = trail.y + trailSpeed
        end
    end
    if trail.x < leader.x - leader.w then
        trail.x = trail.x + leadSpeed
        if trail.y > leader.y then
            trail.y = trail.y - trailSpeed
        elseif trail.y < Tiles.Head.y then
            trail.y = trail.y + trailSpeed
        end
    end
    if trail.y > leader.y + leader.h then
        trail.y = trail.y - leadSpeed
        if trail.x > leader.x then
            trail.x = trail.x - trailSpeed
        elseif trail.x < Tiles.Head.x then
            trail.x = trail.x + trailSpeed
        end
    end
    if trail.y < leader.y - leader.h then
        trail.y = trail.y + leadSpeed
        if trail.x > leader.x then
            trail.x = trail.x - trailSpeed
        elseif trail.x < Tiles.Head.x then
            trail.x = trail.x + trailSpeed
        end
    end
end

Tiles.UpdateMovement = function()
    Tiles.Head:MoveTile()
    if Tiles.BodyCount > 0 then
            for i = Tiles.BodyCount, 1, -1 do
                if Tiles.Body[i][1] == Tiles.Body[1][1] then
                    Tiles.Trail(Tiles.Head, Tiles.Body[i][1], Tiles.Speed, Tiles.TrailSpeed)
                else
                Tiles.Trail(Tiles.Body[i - 1][1], Tiles.Body[i][1], Tiles.Speed, Tiles.TrailSpeed)
            end
        end
    end
end


Tiles.AddBody = function()
    Tiles.BodyCount = Tiles.BodyCount + 1
    Tiles.Body[Tiles.BodyCount] = {}
    --{Tiles.Head.x, Tiles.Head.y, 50, 50}
    if Tiles.BodyCount == 1 then  
    Tiles.Body[Tiles.BodyCount][1] = Tile.new({ 
        x = Tiles.Head.x, 
        y = Tiles.Head.y,
        w = 25,
        h = 25})
    else
        Tiles.Body[Tiles.BodyCount][1] = Tile.new({ 
        x = Tiles.Body[Tiles.BodyCount - 1][1].x, 
        y = Tiles.Body[Tiles.BodyCount - 1][1].y,
        w = 25,
        h = 25})
    end
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
