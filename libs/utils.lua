local utils = {}

function utils:toWorld(x, y) 
	assert(GAME and GAME.Camera) 
	
	local scale = GAME.Camera:getScale() 
	local vx, vy = GAME.Camera:getVisible() 
	local wx, wy = GAME.Camera:getWindow() 
	
	return (x - vx) * scale + wx, (y - vy) * scale + wy
end

-- rect: {x, y, w, h}
function utils:rectContainsPoint(x, y, rect, relativeToCamera)
	local rx, ry = rect.x, rect.y 
	local rw, rh = rect.x + rect.w, rect.y + rect.h
	
	if relativeToCamera then
		rx, ry = utils:toWorld(rx, ry) 
		rw, rh = utils:toWorld(rw, rh)
	end
	
	return (
		x >= rx and 
		y >= ry and 
		x <= rw and 
		y <= rh  
	) 
end

function utils:circleContainsPoint() 
	return 1 
end

function utils:isVisibleByCamera(rect)
	assert(GAME and GAME.Camera) 
	
	local l, t, w, h = GAME.Camera:getVisible()
	local lwin, twin, wwin, hwin = GAME.Camera:getWindow() 
	
	local scale = GAME.Camera:getScale()
	-- top left corner of rect
	local rx, ry = utils:toWorld(rect.x + l, rect.y + t) 
	-- bottom right corner of rect
	local rw, rh = utils:toWorld(rect.x + rect.w, rect.y + rect.h)
		
	if (rx <= (l - rect.w) * scale or 
		ry <= (t - rect.h) * scale or 
		rw >= (w + rect.w) * scale or 
		rh >= (h + rect.h) * scale)  
	then
		return false
	else 
		return true
	end
end

function utils:lenh(t) 
	local i = 0
	
	for _,_ in pairs(t) do 
		i = i + 1 
	end
	
	return i 
end


return utils 