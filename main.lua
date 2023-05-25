local CAMERA_SPEED = 200
local CAMERA_FAST_SPEED = CAMERA_SPEED * 8

GAME = {}
GAME.World = nil 
GAME.Camera = nil
GAME.Cursor = nil 
GAME.ActivePlayer = 0
GAME.Players = {} 
GAME.Buttons = {} 
GAME.Ui = {} 

local rgb = require "libs.rgb" 
local gamera = require "libs.gamera" 
local Class = require "libs.class"  
local Utils = require "libs.utils" 
local Button = require "ui.button" 
local Cursor = require "cursor" 
local Cell = require "cell"
local World = require "world"

local Forest = require "entity.forest" 

function love.load() 
	love.window.setMode(0, 0, {fullscreen = true}) 
	love.mouse.setVisible(false)
	
	love.graphics.setDefaultFilter('nearest', 'nearest')
	
	GAME.Camera = gamera.new(-800, -800, 6800, 4000) 
	GAME.Camera:setScale(0.0)
	GAME.Camera:setPosition(3400, 500)
	
	GAME.World = World:new(45, 20)
	GAME.World:addEntity(Forest, 1, 1)
	GAME.World:addEntity(Forest, 2, 1)
	
	GAME.Cursor = Cursor:new()
	
	test = Button(200, 200, 50, 50, nil, function() print("s") end) 
	
	love.graphics.setBackgroundColor(rgb(255, 255, 255))
end

local fps

function love.update(dt)
	fps = dt 
	
	GAME.Cursor:update(dt) 
	
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	
	local speed = CAMERA_SPEED 
	
	if love.keyboard.isDown("lshift") then
		speed = CAMERA_FAST_SPEED
	end
	
	speed = speed / (GAME.Camera:getScale() * 0.25)

	if love.keyboard.isDown("z") then
		GAME:zoomCamera(-0.35 * dt) 
	end
	
	if love.keyboard.isDown("x") then
		GAME:zoomCamera(0.35 * dt)
	end	
	
	if love.keyboard.isDown("c") then 
		GAME.Camera:setPosition(3400, 500)	
		GAME.Camera:setScale(0)
	end	
	
	if love.keyboard.isDown("w") then
		GAME:moveCamera(0, -speed * dt)
	--	GAME.Cursor:move(0, -250 * dt)
	end
	
	if love.keyboard.isDown("a") then
		GAME:moveCamera(-speed * dt, 0) 
	--	GAME.Cursor:move(-250 * dt, 0)
	end
	
	if love.keyboard.isDown("s") then
		GAME:moveCamera(0, speed * dt) 
	--	GAME.Cursor:move(0, 250 * dt)
	end
	
	if love.keyboard.isDown("d") then
		GAME:moveCamera(speed * dt, 0) 
	--	GAME.Cursor:move(250 * dt, 0)
	end

	
	for _, row in pairs(GAME.World.Map) do 
		for _, cell in pairs(row) do 
			cell:calcVisible()
			cell:checkHighlighted() 
		end
	end
end

local n = 0 

function love.draw() 	
	n = 0 
	GAME.Camera:draw(function() 
		for _, r in pairs(GAME.World.Map) do 
			for _, c in pairs(r) do
				if c.visible then
					c:draw()
					n = n + 1
				end
			end
		end
	end)
	
	for _, button in pairs(GAME.Buttons) do 
		if button.visible then
			button:draw()
		end
	end
			
	love.graphics.setColor(rgb(0,255,0))
	love.graphics.print(fps, 0, 50)
	love.graphics.print(n, 0, 100)
	love.graphics.print("asdsaddaawedfsfsdsffssf\nawdefsesefseffse", 0, 300) 
	
	GAME.Cursor:draw() 			
end

function love.mousepressed(x, y, button, isTouch, presses) 
	for _, btn in pairs(GAME.Buttons) do 
		if button == 1 then 
			btn:pressed() 
		end
	end
end

function GAME:moveCamera(dx, dy) 
	local x, y = self.Camera:getPosition() 
	GAME.Camera:setPosition(x + dx, y + dy) 
end

function GAME:zoomCamera(dz)
	local zoom = self.Camera:getScale() 
		
	self.Camera:setScale(zoom + dz) 
end 