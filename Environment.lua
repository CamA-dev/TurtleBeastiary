setfenv(1, TurtleBeastiary)

---@class Environment
Environment = {}

---@return boolean
function Environment:IsPlayingOnTurtleWoW()
    return TargetHPText ~= nil and TargetHPPercText ~= nil
end
