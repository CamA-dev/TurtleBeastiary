setfenv(1, TurtleBeastiary)


---@class GameAPI
GameAPI = {}
local DB_ab = Bestiary
local DB_id = IDbyNameMob
local DB_id_spell = IDbyNameSpell
local function log(msg) DEFAULT_CHAT_FRAME:AddMessage("GameAPI: "..tostring(msg)) end -- alias for convenience


function GameAPI:IsMob(unit)
    return UnitCanAttack("player", unit) == 1
       and UnitIsFriend("player", unit) == nil
       and UnitIsPlayer(unit) == nil
end


function GameAPI:GetNPCID(unit)
	local name = UnitName(unit);
	--DEFAULT_CHAT_FRAME:AddMessage("UnitName:"..name);
	local firstletter =  string.sub(name,1,1)
	--DEFAULT_CHAT_FRAME:AddMessage("firstletter:"..firstletter);
	--DEFAULT_CHAT_FRAME:AddMessage(type(DB_id))
	
	for fl, data in pairs(DB_id) do
		if fl == firstletter then
			--DEFAULT_CHAT_FRAME:AddMessage("firstletter"..firstletter);
			for unitname, data_name in pairs(data) do
				if unitname == name then
					--DEFAULT_CHAT_FRAME:AddMessage(type(data_name));
					for k, v in pairs(data_name) do
						if k==1 then
							--DEFAULT_CHAT_FRAME:AddMessage(k.." "..v);
							return  v
						end
					end
				end
			end
		end
	end
end


local warper_spell_id;

local function WarperGetSpellInfoById()
	return GetSpellInfoById(warper_spell_id);
end


local function ErrorHandlingGetSpellInfoById()
	local name, rank, icon, cost, isFunnel, powerType = nil;
	return name, rank, icon, cost, isFunnel, powerType
end


function GameAPI:GetAbilities(unit)
    local result = {}
	local npc_id = GameAPI:GetNPCID(unit)
	
    if not npc_id then
		local dto = {name = "N/A for Custom NPCs"}
		tinsert(result, dto)
		return result
	end
	
	
	local abilities = DB_ab.map[npc_id]
	
	
	if abilities ~= nil then
		for _, spell_id in ipairs(abilities) do
			--local name, _icon, _castTime, _minRange, _maxRange = GetSpellInfo(spell_id);
			
			warper_spell_id = spell_id;
			local func = WarperGetSpellInfoById;
			local err = ErrorHandlingGetSpellInfoById;
			
			local status, name, rank, icon, cost, isFunnel, powerType = xpcall(func, err);
			
			
			if status == false then
				name = "Spellid "..spell_id.." not found"
			end
			
			
			if name ~= nil then
				local icon = "";
				local texture = null;--GetSpellTexture(spell_id);
				if (texture ~= nil) then
					icon = "|T" .. texture .. ":0|t";
				end
				local tip = nil;--DB_id.tip[spell_id];
				

				local dto = {name = name}
				tinsert(result, dto)
			
			end
		end
    end

    return result
end
