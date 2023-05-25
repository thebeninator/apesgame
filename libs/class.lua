local Class = {}
Class._type = "Class" 
Class.__index = Class
Class.__call = function(self, ...) 
	local o = setmetatable({}, self) 
	
	if o._super and o._super.init then
		o._super.init(o, ...)
	end
	
	if o.init then o:init(...) end 
	
	return o 
end

function Class:extend(type) 
	local o = {_type = type, _super = self}
	o.__index = o
	o.__call = self.__call 
	
	setmetatable(o, self) 
	
	return o 
end

function Class:typeOf(type)
	return self._type == type
end

function Class:type() 
	return self._type 
end

function Class:derivedFrom(type) 
	return self._super._type == type 
end

function Class:super() 
	return self._super
end

return Class 