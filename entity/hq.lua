local Entity = require "entity.entity"
local rgb = require "libs.rgb" 
local Headquarters = Entity:extend("Headquarters") 

function Headquarters:init(x, y) 
	self.type = "BUILDING"
end

return Headquarters