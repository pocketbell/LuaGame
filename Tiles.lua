local Tile = require("Tile")

Tiles = {}

Tiles.Head = Tile.new({x = 50, y = 50, w = 50, h = 50})
Tiles.Body = {}
Tiles.BodyCount = 0
Tiles.Speed = 1
Tiles.TrailSpeed = .2

Tiles.UpdateMovement = function()
    Tiles.Head:MoveTile()
    if Tiles.BodyCount > 0 then
        for i = Tiles.BodyCount, 1, -1 do
            for i = Tiles.BodyCount, 1, -1 do
                if Tiles.Body[i][1] == Tiles.Body[1][1] then
                    if love.keyboard.isDown("w") then 
                        if Tiles.Body[i][1].x > Tiles.Head.x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].x < Tiles.Head.x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].y > Tiles.Head.y + Tiles.Head.h then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - Tiles.Speed
                        end
                    elseif love.keyboard.isDown("s") then 
                        if Tiles.Body[i][1].x > Tiles.Head.x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].x < Tiles.Head.x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].y < Tiles.Head.y - Tiles.Head.h then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + Tiles.Speed
                        end
                    elseif love.keyboard.isDown("a") then 
                        if Tiles.Body[i][1].y > Tiles.Head.y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].y < Tiles.Head.y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].x > Tiles.Head.x + Tiles.Head.h then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - Tiles.Speed
                        end
                    elseif love.keyboard.isDown("d") then 
                        if Tiles.Body[i][1].y > Tiles.Head.y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].y < Tiles.Head.y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].x < Tiles.Head.x - Tiles.Head.h then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + Tiles.Speed
                        end
                    end
                else
                    if love.keyboard.isDown("w") then 
                        if Tiles.Body[i][1].x > Tiles.Body[i -1][1].x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].x < Tiles.Body[i -1][1].x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].y > Tiles.Body[i -1][1].y + Tiles.Body[i -1][1].h then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - Tiles.Speed
                        end
                    elseif love.keyboard.isDown("s") then 
                        if Tiles.Body[i][1].x > Tiles.Body[i -1][1].x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].x < Tiles.Body[i -1][1].x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].y < Tiles.Body[i -1][1].y - Tiles.Body[i -1][1].h then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + Tiles.Speed
                        end
                    elseif love.keyboard.isDown("a") then 
                        if Tiles.Body[i][1].y > Tiles.Body[i -1][1].y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].y < Tiles.Body[i -1][1].y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].x > Tiles.Body[i -1][1].x + Tiles.Body[i -1][1].h then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - Tiles.Speed
                        end
                    elseif love.keyboard.isDown("d") then 
                        if Tiles.Body[i][1].y > Tiles.Body[i -1][1].y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].y < Tiles.Body[i -1][1].y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + Tiles.TrailSpeed
                        end
                        if Tiles.Body[i][1].x < Tiles.Body[i -1][1].x - Tiles.Body[i -1][1].h then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + Tiles.Speed
                        end
                    end
                end
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

return Tiles