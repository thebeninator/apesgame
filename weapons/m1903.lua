local Weapon = require "weapons.weapon" 
local Weapon_M1903 = Weapon:extend("M1903") 

function Weapon_M1903:init() 
	self.name = "M1903" 
	self.description = "Bolt-action rifle made from wood.\neWoefully outdated but its cheap to manufacture." 
end
	
	
	

	
Weapon_M1903:register() 
	
return Weapon_M1903