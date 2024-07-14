setfenv(1, TurtleBeastiary)

---@class TooltipInterface
TooltipInterface = {}

---@return string
function TooltipInterface:GetValueColor()
    return HIGHLIGHT_FONT_COLOR_CODE
end

---@param label string
---@param value string
---@param wrap boolean
function TooltipInterface:AddValue(label, value, wrap)
    local label_color = NORMAL_FONT_COLOR_CODE
    local value_color = self:GetValueColor()
    GameTooltip:AddLine(
        format('%s %s', paint(label .. ":", label_color), paint(value, value_color)),
        nil,
        nil,
        nil,
        boolean_to_wowboolean(wrap))
end


function TooltipInterface:AddLine(value)
    local value_color = self:GetValueColor()
    GameTooltip:AddLine(
        format('%s', paint(value, value_color)),
        nil,
        nil,
        nil,
        boolean_to_wowboolean(false))
end


function TooltipInterface:AddAbility(icon, label, tip)
    local label_color = NORMAL_FONT_COLOR_CODE
    local value_color = self:GetValueColor()
    GameTooltip:AddLine(
        format('%s', paint(label .. ":", label_color)),
        nil,
        nil,
        nil,
        boolean_to_wowboolean(false))
end
