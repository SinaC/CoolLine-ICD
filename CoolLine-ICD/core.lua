local CoolLine = CoolLine
assert(CoolLine, "CoolLine not found") -- TODO: locales

local LibICD = LibStub("LibInternalCooldowns-1.0")
assert(LibICD, "LibInternalCooldowns-1.0 not found") -- TODO: locales

--print("CoolLineICD")

local CoolLineICD = CreateFrame("Frame")

function CoolLineICD:InternalCooldowns_TalentProc(callback, spellID, start, duration)
	local name, _, icon = GetSpellInfo(spellID)
	local endtime = start + duration
--print("InternalCooldowns_TalentProc:"..tostring(spellID).."  "..tostring(start).."  "..tostring(duration).."  "..tostring(name))
	CoolLine.NewCooldown(name, icon, endtime, true)
end

function CoolLineICD:InternalCooldowns_Proc(callback, itemID, spellID, start, duration)
	local icon = select(10, GetItemInfo(itemID))
	local name = GetItemInfo(itemID)
	local endtime = start + duration
--print("InternalCooldowns_Proc:"..tostring(itemID).."  "..tostring(spellID).."  "..tostring(start).."  "..tostring(duration).."  "..tostring(name))
	CoolLine.NewCooldown(name, icon, endtime, true)
end

LibICD.RegisterCallback(CoolLineICD, "InternalCooldowns_TalentProc")
LibICD.RegisterCallback(CoolLineICD, "InternalCooldowns_Proc")
