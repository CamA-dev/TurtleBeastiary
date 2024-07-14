setfenv(1, TurtleBeastiary)


AbilityVO = {}


function AbilityVO:Construct(icon, name, tip)
	if type(icon)==nil then
		icon = ""
	end
	if type(tip)==nil then
		tip = ""
	end
	if type(_name)==nil then
		_name = ""
	end
	
    
    local object = new(AbilityVO)
    object._icon = icon
    object._name = name
	object._tip = tip
    return object
end

---@return ResistanceId
function AbilityVO:GetId()
    return self._id
end

---@return number
function AbilityVO:GetAverageResistanceInPercents()
    return self._average_resistance_in_percents
end

---@return boolean
function AbilityVO:CouldBeHigher()
    return self._could_be_higher
end
