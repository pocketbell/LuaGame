local Tile = require("Tile")

Tiles = {}

Tiles.Head = Tile.new({x = 50, y = 50, w = 50, h = 50})
Tiles.Body = {}
Tiles.BodyCount = 0
Tiles.Speed = 1
Tiles.TrailSpeed = 1

Tiles.CheckCollision = function(body, object)
    if body.x > object.x - object.w and body.x < object.x + object.w and body.y > object.y - object.h and body.y < object.y + object.h then
        return true
    else
        return false
    end
end

Tiles.RaiseVal = function(object, amount)
    object.val = object.val + amount
end

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
    if Tiles.BodyCount == 1 then  
    Tiles.Body[Tiles.BodyCount][1] = Tile.new({ 
        x = Tiles.Head.x, 
        y = Tiles.Head.y,
        w = 50,
        h = 50})
    else
        Tiles.Body[Tiles.BodyCount][1] = Tile.new({ 
        x = Tiles.Body[Tiles.BodyCount - 1][1].x, 
        y = Tiles.Body[Tiles.BodyCount - 1][1].y,
        w = 50,
        h = 50})
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

Tiles.CalculateAddBody = function(value)
    if Tiles.BodyCount > 0 then
        if Tiles.Body[Tiles.BodyCount][1].val == value then
            Tiles.Body[Tiles.BodyCount][1].val = Tiles.Body[Tiles.BodyCount][1].val + value
        else 
            Tiles.AddBody()
        end
    else
        if Tiles.Head.val == value then
            Tiles.Head.val = Tiles.Head.val + value
        else 
            Tiles.AddBody()
        end
    end
end

Tiles.CalculateReduceBody = function()
    for i = 0, Tiles.BodyCount do
        if Tiles.BodyCount > 1 then
            if Tiles.Body[Tiles.BodyCount][1].val == Tiles.Body[Tiles.BodyCount - 1][1].val then
                Tiles.Body[Tiles.BodyCount - 1][1].val = Tiles.Body[Tiles.BodyCount - 1][1].val + Tiles.Body[Tiles.BodyCount][1].val
                table.remove(Tiles.Body[Tiles.BodyCount])
                Tiles.BodyCount = Tiles.BodyCount - 1
            end
        elseif Tiles.BodyCount > 0 then
            if Tiles.Body[Tiles.BodyCount][1].val == Tiles.Head.val then
                Tiles.Head.val = Tiles.Head.val + Tiles.Body[Tiles.BodyCount][1].val
                table.remove(Tiles.Body[Tiles.BodyCount])
                Tiles.BodyCount = Tiles.BodyCount - 1
            end
        end
    end
end

return Tiles