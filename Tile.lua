local tile = {}
tile.__index = tile

function tile.new(settings)
  local instance = setmetatable({}, tile)

  instance.x = settings.x or 0
  instance.y = settings.y or 0
  instance.w = settings.w or 25
  instance.h = settings.h or 25
  --[[
  instance.x = 0
  instance.y = 0
  instance.w = 50
  instance.h = 50
  ]]
  return instance
end

function tile:draw()
  love.graphics.setColor({0,1,0,1})
  love.graphics.circle("fill", self.x, self.y, self.w)
end

tile.MoveTile = function(self)
if love.keyboard.isDown("w") then
        self.y = self.y - 1
elseif love.keyboard.isDown("s") then
        self.y = self.y + 1
elseif love.keyboard.isDown("a") then
        self.x = self.x - 1
elseif love.keyboard.isDown("d") then
        self.x = self.x + 1
    end
end

return tile