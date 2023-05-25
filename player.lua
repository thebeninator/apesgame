local Class = require "libs.class" 
local Player = Class:extend("Player") 

function Player:new(id, faction) 
	self.id = #GAME.Players 
	self.faction = faction 
	self.active = true
	self.gamedata = {
		RiflemanPrimary = nil,
		Money = 1500, 
		Wood = 0, 
		Metal = 0, 
		FossilFuel = 0, 
		HighQualityMetal = 0,
		upgrades = GAME.Upgrades  
	} 
	
	table.insert(GAME.Players, self) 
end
