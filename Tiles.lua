local Tile = require("Tile")

Tiles = {}

Tiles.Head = Tile.new({x = 50, y = 50, w = 50, h = 50})
Tiles.Body = {}
Tiles.BodyCount = 0


Tiles.UpdateMovement = function()
    Tiles.Head:MoveTile()
    if Tiles.BodyCount > 0 then
        for i = Tiles.BodyCount, 1, -1 do
            for i = Tiles.BodyCount, 1, -1 do
                if Tiles.Body[i][1] == Tiles.Body[1][1] then
                    if love.keyboard.isDown("w") then 
                        if Tiles.Body[i][1].x > Tiles.Head.x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - .5
                        end
                        if Tiles.Body[i][1].x < Tiles.Head.x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + .5
                        end
                        if Tiles.Body[i][1].y > Tiles.Head.y + Tiles.Head.h then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - 1
                        end
                    end
                    if love.keyboard.isDown("s") then 
                        if Tiles.Body[i][1].x > Tiles.Head.x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - .5
                        end
                        if Tiles.Body[i][1].x < Tiles.Head.x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + .5
                        end
                        if Tiles.Body[i][1].y < Tiles.Head.y - Tiles.Head.h then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + 1
                        end
                    end
                    if love.keyboard.isDown("a") then 
                        if Tiles.Body[i][1].y > Tiles.Head.y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - .5
                        end
                        if Tiles.Body[i][1].y < Tiles.Head.y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + .5
                        end
                        if Tiles.Body[i][1].x > Tiles.Head.x + Tiles.Head.h then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - 1
                        end
                    end
                    if love.keyboard.isDown("d") then 
                        if Tiles.Body[i][1].y > Tiles.Head.y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - .5
                        end
                        if Tiles.Body[i][1].y < Tiles.Head.y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + .5
                        end
                        if Tiles.Body[i][1].x < Tiles.Head.x - Tiles.Head.h then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + 1
                        end
                    end
                else
                    if love.keyboard.isDown("w") then 
                        if Tiles.Body[i][1].x > Tiles.Body[i -1][1].x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - .5
                        end
                        if Tiles.Body[i][1].x < Tiles.Body[i -1][1].x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + .5
                        end
                        if Tiles.Body[i][1].y > Tiles.Body[i -1][1].y + Tiles.Body[i -1][1].h then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - 1
                        end
                    end
                    if love.keyboard.isDown("s") then 
                        if Tiles.Body[i][1].x > Tiles.Body[i -1][1].x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - .5
                        end
                        if Tiles.Body[i][1].x < Tiles.Body[i -1][1].x then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + .5
                        end
                        if Tiles.Body[i][1].y < Tiles.Body[i -1][1].y - Tiles.Body[i -1][1].h then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + 1
                        end
                    end
                    if love.keyboard.isDown("a") then 
                        if Tiles.Body[i][1].y > Tiles.Body[i -1][1].y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - .5
                        end
                        if Tiles.Body[i][1].y < Tiles.Body[i -1][1].y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + .5
                        end
                        if Tiles.Body[i][1].x > Tiles.Body[i -1][1].x + Tiles.Body[i -1][1].h then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x - 1
                        end
                    end
                    if love.keyboard.isDown("d") then 
                        if Tiles.Body[i][1].y > Tiles.Body[i -1][1].y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y - .5
                        end
                        if Tiles.Body[i][1].y < Tiles.Body[i -1][1].y then
                            Tiles.Body[i][1].y = Tiles.Body[i][1].y + .5
                        end
                        if Tiles.Body[i][1].x < Tiles.Body[i -1][1].x - Tiles.Body[i -1][1].h then
                            Tiles.Body[i][1].x = Tiles.Body[i][1].x + 1
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