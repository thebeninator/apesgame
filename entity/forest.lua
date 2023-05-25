local Entity = require "entity.entity"
local rgb = require "libs.rgb" 
local Forest = Entity:extend("Forest") 

function Forest:init(x, y) 
	self.type = "LAND"
	self.pollution = 0
	self.burning = false 
end

function Forest:update(dt) 
	
end

function Forest:draw() 
	local cell = GAME.World:GetCell(self.x, self.y)
	love.graphics.setColor(rgb(0, 255, 0)) 
	love.graphics.rectangle("fill", cell.x + 32 - 15, cell.y + 32 - 15, 30, 30) 
end 

return Forest