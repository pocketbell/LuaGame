Food = {}

Food.Value = 2
Food.x = 300
Food.y = 300
Food.h = 50
Food.w = 50
Food.Color = {1,0,0,1}

Food.Draw = function()
    love.graphics.setColor(Food.Color)
    love.graphics.rectangle("fill", Food.x, Food.y, Food.w, Food.h)
end

return Food