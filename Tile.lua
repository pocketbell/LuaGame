local tile = {}
tile.__index = tile

function tile.new(settings)
  local instance = setmetatable({}, tile)

  instance.x = settings.x or 0
  instance.y = settings.y or 0
  instance.w = settings.w or 50
  instance.h = settings.h or 50
  --[[
  instance.x = 0
  instance.y = 0
  instance.w = 50
  instance.h = 50
  ]]
  return instance
end

function tile:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

tile.MoveTile = function(self)
if love.keyboard.isDown("w") then
        self.y = self.y - 1
    end
    if love.keyboard.isDown("s") then
        self.y = self.y + 1
    end
    if love.keyboard.isDown("a") then
        self.x = self.x - 1
    end
    if love.keyboard.isDown("d") then
        self.x = self.x + 1
    end
end

return tile