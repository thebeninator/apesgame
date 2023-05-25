local Entity = require "entity.entity"
local rgb = require "libs.rgb" 
local Building = Entity:extend("Building")

function Building:init(x, y, team) 
	self.team = "NONE"
end

function Building:draw() 
	
end

function Building:update(dt) 
	
end

return Building