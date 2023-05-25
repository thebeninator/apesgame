local Class = require "libs.class" 
local Utils = require "libs.utils" 
local rgb = require "libs.rgb"
local Button = Class:extend("Button")

function Button:init(x, y, w, h, label, onClick, active)
	self.x = x 
	self.y = y
	self.w = w
	self.h = h 
	self.label = label or "" 
	self.onClick = onClick or function() return 0 end 
	self.rect = {x = x, y = y, w = w, h = h} 
	self.active = active or true 
	self.visible = true 
	
	table.insert(GAME.Buttons, self) 
end

function Button:update(dt) 
	
end

function Button:draw() 
	love.graphics.setColor(rgb(100, 100, 0))
	love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

function Button:isHighlighted() 
	if self.visible then
		if Utils:rectContainsPoint(GAME.Cursor.x, GAME.Cursor.y, self.rect) then
			return true 
		end
	end	
	
	return false
end

function Button:pressed() 
	if self:isHighlighted() and self.active then 
		self:onClick() 
	end
end

return Button