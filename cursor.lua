local rgb = require "libs.rgb"  
local Cursor = {} 

local SIZE = 8

function Cursor:new(x, y) 
	self.x = love.graphics.getWidth() / 2 - SIZE
	self.y = love.graphics.getHeight() / 2 - SIZE 
	
	return self
end

function Cursor:update(dt) 
	local mx, my = love.mouse.getPosition()
	self.x = mx 
	self.y = my
end

function Cursor:move(dx, dy) 
	self.x = self.x + dx
	self.y = self.y + dy
end

function Cursor:GetPos() 
	return self.x, self.y 
end

function Cursor:draw() 
	love.graphics.setColor(rgb(0, 0, 255)) 
	love.graphics.rectangle("line", self.x - SIZE / 2, self.y - SIZE / 2,  SIZE, SIZE)
end

return Cursor