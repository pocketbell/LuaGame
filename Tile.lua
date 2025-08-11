local tile = {}
tile.__index = tile

function tile.new(settings)
  local instance = setmetatable({}, tile)

  instance.x = settings.x or 0
  instance.y = settings.y or 0
  instance.w = settings.w or 50
  instance.h = settings.h or 50
  instance.val = 2
  --[[
  instance.x = 0
  instance.y = 0
  instance.w = 50
  instance.h = 50
  ]]
  return instance
end

tile.SetColor = function(self)
        if self.val == 2 then
          return {0,1,0,1}
        elseif self.val == 4 then
          return {1,0,0,1}
        elseif self.val == 8 then
          return {0,0,1,1}
        elseif self.val == 16 then
          return {1,1,0,1}
        elseif self.val == 32 then
          return {0,1,1,1}
        elseif self.val == 64 then
         return {1,0,1,1}
        else
          return {1,.5,.5,1}
        end
end

function tile:draw()
  love.graphics.setColor(self:SetColor())
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
  love.graphics.setColor({0,0,0,1})
  love.graphics.print(self.val, self.x, self.y, 0, 2, 2)
end

tile.MoveTile = function(self)
if love.keyboard.isDown("w") then
        self.y = self.y - 1
elseif love.keyboard.isDown("s") then
        self.y = self.y + 1
end
if love.keyboard.isDown("a") then
        self.x = self.x - 1
elseif love.keyboard.isDown("d") then
        self.x = self.x + 1
    end
end

return tile