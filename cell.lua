local rgb = require "libs.rgb" 
local Utils = require "libs.utils"
local Class = require "libs.class" 

local Cell = Class:extend("Cell")  
Cell.CELL_SIZE = 64
Cell.CELL_COLOR = rgb(0, 0, 0) 
Cell.CELL_FCOLOR = rgb(255, 255, 255)

function Cell:init(x, y, color, fcolor) 
	self.rect = {
		x = x,
		y = y, 
		w = Cell.CELL_SIZE, 
		h = Cell.CELL_SIZE 
	} 
	
	self.x = x 
	self.y = y 
	self.rect.w = Cell.CELL_SIZE
	self.rect.h = Cell.CELL_SIZE
	self.color = color or Cell.CELL_COLOR 
	self.fcolor = fcolor or Cell.CELL_FCOLOR
	self.highlighted = true
	self.boundary = false 
	self.visible = true 
	self.entities = {} 	
end

-- color: rgb(r, g, b, a)
function Cell:setColor(color) 
	self.color = color 
end 

function Cell:draw() 
	love.graphics.setLineWidth(1)
	
	if self.boundary then
		love.graphics.setColor(rgb(0,0,0))  
		love.graphics.rectangle("fill", self.x, self.y, self.CELL_SIZE, self.CELL_SIZE)
		love.graphics.rectangle("line", self.x, self.y, self.CELL_SIZE, self.CELL_SIZE) 
	end
		
	if self.highlighted then
		love.graphics.setColor(self.color) 
		love.graphics.rectangle("line", self.x, self.y, self.CELL_SIZE, self.CELL_SIZE) 
	end 
	
	for i, entity in pairs(self.entities) do 
		if entity then entity:draw() end 
	end	
end

function Cell:update(dt) 
end

function Cell:checkHighlighted() 
	if self.visible then
		if Utils:rectContainsPoint(GAME.Cursor.x, GAME.Cursor.y, self.rect, true) then
			self:setColor(rgb(0,0,0))
			self.highlighted = true
		else 
			self:setColor(Cell.CELL_COLOR) 
			self.highlighted = false
		end
	end		
end

function Cell:calcVisible() 
	self.visible = Utils:isVisibleByCamera(self.rect) 
end

return Cell 