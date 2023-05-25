local Class = require "libs.class" 
local Weapon = Class:extend("Weapon") 

GAME.Weapons = {} 

--[[ 

weapons 
[ ] m1903, wood  
	> Bolt-action rifle made from wood. Woefully outdated but insanely cheap to manufacture.
[ ] m700, polymer
	> Bolt-action rifle made from modern polymers. Cheap but easily outgunned. 
[ ] akm, metal + wood 
	> Assault rifle
[ ] ak74, metal + wood 
[ ] m16, metal + polymer
[ ] mg3, hq metal (spec, primary)
[ ] at4, polymer (spec, secondary) 
[ ] carl g, hq metal + polymer (spec, secondary)  

ammo 
[ ] lead 
[ ] lead free
[ ] reduced charge 
[ ] depleted uranium 

]]-- 

function Weapon:init() 
	self.name = ""
	self.description = "" 
	self.emissions = 0
	self.shotsPerBurst = 1
	self.chanceToFire = 1 -- roll d10
	self.chanceToMiss = 1 -- roll d10 
	self.damage = 1 
	self.manufactCost = 100
	self.effectiveRange = 1 
	self.usesBullets = true 
	self.singleUse = false 
end

function Weapon:fire() 
	
end

function Weapon:register() 
	assert(GAME) 
	
	table.insert(GAME.Weapons, self) 
end

return Weapon