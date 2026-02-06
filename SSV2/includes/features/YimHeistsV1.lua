-- Copyright (C) 2026 SAMURAI (xesdoog) & Contributors.
-- This file is part of Samurai's Scripts.
--
-- Permission is hereby granted to copy, modify, and redistribute
-- this code as long as you respect these conditions:
--	* Credit the owner and contributors.
--	* Provide a copy of or a link to the original license (GPL-3.0 or later); see LICENSE.md or <https://www.gnu.org/licenses/>.


local SGSL = require("includes.services.SGSL")


---@class YimHeists
---@field private m_raw_data RawBusinessData
---@field m_tab Tab
---@field protected m_thread Thread?
local YimHeists = { m_raw_data = require("includes.data.yrv3_data") }
YimHeists.__index = YimHeists

---@return YimHeists
function YimHeists:init()
	local instance = setmetatable({
		m_tab = GUI:RegisterNewTab(Enums.eTabID.TAB_ONLINE, "YimHeists")
	}, self)

	instance.m_thread = ThreadManager:RegisterLooped("SS_YH", function()
		instance:Main()
	end)

	return instance
end

---@param idx integer
---@return boolean
function YimHeists:IsPropertyIndexValid(idx)
	if (type(idx) ~= "number") then
		return false
	end

	return idx > 0 and idx < math.int32_max()
end

function YimHeists:CanAccess()
	return (Backend:GetAPIVersion() == Enums.eAPIVersion.V1)
		and Backend:IsUpToDate()
		and Game.IsOnline()
		and not script.is_active("maintransition")
		and not NETWORK.NETWORK_IS_ACTIVITY_SESSION()
end

--@param statName string
--@param statVal integer
--@param notifTitle string
function YimHeists:SkipPrep(statName, statVal, notifTitle)
	if (stats.get_int(statName) == statVal) then
		return
	end

	stats.set_int(statName, statVal)
	Notifier:ShowSuccess(notifTitle, _T("YH_PREP_SKIP_NOTIF"))
end

--@return vec3
function YimHeists:GetAgencyLocation()
	local property_index = stats.get_int("MPX_FIXER_HQ_OWNED")
	if (not self:IsPropertyIndexValid(property_index)) then
		return
	end

	local ref       = self.m_raw_data.Agencies[property_index]
	return ref.coords
end

function YimHeists:Main()
	if (not Backend:IsUpToDate() and self.m_thread and self.m_thread:IsRunning()) then
		self.m_thread:Stop()
	end

	if (not self:CanAccess()) then
		sleep(500)
		return
	end
end

return YimHeists
