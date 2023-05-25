local Class = require "libs.class" 
local UiRoot = Class:extend("UiRoot") 

function UiRoot:init() 
	self.widgets = {} 
end

function UiRoot:add(widget) 
	table.insert(self.widgets, widget) 
end

function UiRoot:update() 
	
end 

function UiRoot:draw() 
	
end

return UiRoot 