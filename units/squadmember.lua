local Class = require "libs.class" 
local Squadmember = Class:extend("Squadmember") 

Squadmember.STATUS = {
	["Healthy"] = 4, 
	["Wounded"] = 3, 
	["HeavilyWounded"] = 2,
	["NearDeath"] = 1 
	["Dead"] = 0 
} 

function Squadmember:init() 
	self.status = Squadmember.STATUS.Healthy 
	self.weapon = nil 
end

return Squadmember