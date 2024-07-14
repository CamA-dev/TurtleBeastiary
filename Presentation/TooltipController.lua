setfenv(1, TurtleBeastiary)

---@param mob_stats TurtleBeastiaryApplicationDTO
local function draw(mob_stats)
    AbilityDrawer:Draw(mob_stats.ability, TooltipInterface)
end

local function do_nothing() end

---@type function
local previous_script
local frame = CreateFrame("Frame")
frame:RegisterEvent("VARIABLES_LOADED")
frame:SetScript("OnEvent", function ()
    previous_script = GameTooltip:GetScript("OnShow") or do_nothing
    GameTooltip:SetScript("OnShow", function()
        local stats = ApplicationService:GetTurtleBeastiary("mouseover")
        if stats ~= nil then
            draw(--[[---@type TurtleBeastiaryApplicationDTO]] stats)
            GameTooltip:Show()
        end
        previous_script()
    end)
end)
