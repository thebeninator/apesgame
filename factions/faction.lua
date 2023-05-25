local Class = require "libs.class" 
local Faction = Class:extend("Faction")

function Faction:init() 
	self.name = "" 
	self.description = "" 
	self.loseConditions = {}
	self.winConditions = {} 
end

return Faction