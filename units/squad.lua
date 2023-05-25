local Entity = require "entity.entity" 
local Squad = Entity:extend("Squad") 

local rgb = require "libs.rgb" 

function Squad:init(x, y, owner) 
	self.owner = owner
	self.members = {}
	self.name = ""
	self.destroyed = false 
end

function Squad:draw() 
	
end

function Squad:update(dt) 
	
end

return Squad 