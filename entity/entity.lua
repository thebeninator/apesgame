local utils = require "libs.utils" 
local Class = require "libs.class" 
local Entity = Class:extend("Entity")

function Entity:init(x, y) 
	assert(GAME and GAME.World) 
	self.x = x
	self.y = y
	self.type = nil
end

function Entity:add() 
	if self.type then
		GAME.World.Map[self.x][self.y].entities[self.type] = self
	end	
end

function Entity:GetPos() 
	assert(GAME and GAME.World) 
	
	return GAME.World.Map[self.x][self.y] 
end

function Entity:draw() 
end

function Entity:update() 
end

return Entity