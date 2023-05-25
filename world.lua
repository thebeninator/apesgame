local Cell = require "cell" 
local WORLD_MAP_OFFSET_X = Cell.CELL_SIZE * 16
local WORLD_MAP_OFFSET_Y = 500

local World = {} 
World.Map = {} 
World.Temperature = 53
World.CO2 = 200
World.CO2_MAX = 1000 

function World:new(rows, cols)
	for r = 0, rows do
		self.Map[r] = {} 
		
		for c = 0, cols do
			local rPadding = 1 * r
			local cPadding = 1 * c
						
			local cell = Cell(
				r * Cell.CELL_SIZE + rPadding + WORLD_MAP_OFFSET_X, 
				c * Cell.CELL_SIZE + cPadding + WORLD_MAP_OFFSET_Y,
				nil, 
				nil 
			)
			
			if (r == 0 or r == rows or c == 0 or c == cols) then
				cell.boundary = true 
			end	
			
			self.Map[r][c] = cell
		end
	end
	
	return self
end

function World:GetCell(x, y) 
	return self.Map[x][y] 
end

function World:addEntity(entity, row, col) 
	entity(row, col):add()
end
	
return World 