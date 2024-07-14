setfenv(1, TurtleBeastiary)
local function log(msg) DEFAULT_CHAT_FRAME:AddMessage("AbilityDrawer: "..msg) end -- alias for convenience

---@class AbilityDrawer
AbilityDrawer = {}



---@param resistances AbilityVO[]
---@param tooltip TooltipInterface
function AbilityDrawer:Draw(ability, tooltip)
	
    local strings = {}
    for num, dto in pairs(ability) do
		
		local formatted_string = format("%s", dto._name)
		tinsert(strings, paint(formatted_string, tooltip:GetValueColor()))
    end

    if getn(strings) == 0 then
        tinsert(strings, "None")
    end
	
	tooltip:AddValue("Ability", strjoin(strings, paint(", ", tooltip:GetValueColor())), true)
	--tooltip:AddLine("(Ctrl for more details)")
end
