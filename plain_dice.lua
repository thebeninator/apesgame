local Class = require "libs.class" 

local PlainDice = Class:extend("PlainDice") 

function PlainDice:init(sides) 
	self.sides = sides 
end

function PlainDice:draw() 
	
end

function PlainDice:roll()
	return math.random(self.sides) 
end

return PlainDice