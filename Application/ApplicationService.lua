setfenv(1, TurtleBeastiary)
local function log(msg) DEFAULT_CHAT_FRAME:AddMessage("ApplicationService: "..msg) end -- alias for convenience
---@class ApplicationService
ApplicationService = {}



---@param unit UnitId
---@return TurtleBeastiaryApplicationDTO|nil
function ApplicationService:GetTurtleBeastiary(unit)
    if not GameAPI:IsMob(unit) then
        return nil
    end
		
	
	
    local ability = {}
    for _, dto in ipairs(GameAPI:GetAbilities(unit)) do
        tinsert(ability, AbilityVO:Construct(dto.texture, dto.name, dto.tip))
    end

    return {
        ability = ability,
    }
end
