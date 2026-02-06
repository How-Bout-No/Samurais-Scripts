-- Copyright (C) 2026 SAMURAI (xesdoog) & Contributors.
-- This file is part of Samurai's Scripts.
--
-- Permission is hereby granted to copy, modify, and redistribute
-- this code as long as you respect these conditions:
--	* Credit the owner and contributors.
--	* Provide a copy of or a link to the original license (GPL-3.0 or later); see LICENSE.md or <https://www.gnu.org/licenses/>.


local YHV1 = require("includes.features.YimHeistsV1"):init()
local SGSL         = require("includes.services.SGSL")

---@param where integer|vec3
---@param keepVehicle? boolean
function YHV1:Teleport(where, keepVehicle)
	if not Self:IsOutside() then
		Notifier:ShowError("YHV1", "Please go outside first!")
		return
	end

	Self:Teleport(where, keepVehicle)
end
---@class HeistInfo
---@field name string
---@field location? integer|vec3
---@field stat string
---@field val integer

---@alias HEIST_TYPES table<integer, HeistInfo>

---@type HEIST_TYPES
local HEIST_TYPES <const>   = {
	-- { name = "Cluckin Bell", location = 871, stat = "MPX_SALV23_INST_PROG",  val = 31 },
	{ name = "Cluckin Bell", location = vec3:new(-1093.15, -807.14, 20.28), stat = "MPX_SALV23_INST_PROG",  val = 31 },
	-- { name = "KnoWay", location = 76, stat = "MPX_M25_AVI_MISSION_CURRENT",  val = 4 },
	{ name = "KnoWay", location = vec3:new(42.82, -1599.19, 30.60), stat = "MPX_M25_AVI_MISSION_CURRENT",  val = 4 },
	{ name = "Dr. Dre", location = YHV1:GetAgencyLocation(), stat = "MPX_FIXER_STORY_BS",  val = 4095  },
	-- { name = "Oscar Guzman", location = 903, stat = "MPX_HACKER24_INST_BS",  val = 31 }, -- TODO: Check for McKenzie ownership
	{ name = "Oscar Guzman", location = vec3:new(2150.65, 4796.60, 42.17), stat = "MPX_HACKER24_INST_BS",  val = 31 },
}

local function drawBasicTab()
	ImGui.SeparatorText(_T "YH_PREP_SETTINGS")
	
	for i, heist in ipairs(HEIST_TYPES) do
		ImGui.BeginDisabled(not heist.location or not Game.IsValidCoords(heist.location))
		ImGui.PushID(i)
		ImGui.BulletText(heist.name)

		if (GUI:Button(_T("GENERIC_TELEPORT"))) then
			YHV1:Teleport(heist.location, false)
		end

		ImGui.SameLine()
		if (GUI:Button(_T("GENERIC_SET_WAYPOINT"))) then
			Game.SetWaypointCoords(heist.location)
		end

		ImGui.EndDisabled()
		
		ImGui.SameLine()

		ImGui.BeginDisabled(stats.get_int(heist.stat) == heist.val)
		if GUI:Button(_T "YH_PREP_SKIP") then
			YHV1:SkipPrep(heist.stat, heist.val, heist.name)
		end
		ImGui.EndDisabled()
		ImGui.PopID()
	end

end

local function DrawDunk()
	if (not Game.IsOnline() or not Backend:IsUpToDate()) then
		ImGui.Text(_T("GENERIC_OFFLINE_OR_OUTDATED"))
		return
	end

	if (ImGui.BeginTabBar("##dunkBar")) then
		ImGui.PushStyleVar(ImGuiStyleVar.ItemSpacing, 10, 10)

		if ImGui.BeginTabItem(_T("YH_BASIC_TAB")) then
			drawBasicTab()
			ImGui.EndTabItem()
		end

		-- if ImGui.BeginTabItem(_T("YH_HEIST_TAB")) then
		-- 	drawHeistTab()
		-- 	ImGui.EndTabItem()
		-- end

		ImGui.PopStyleVar()
		ImGui.EndTabBar()
	end
end

YHV1.m_tab:RegisterGUI(DrawDunk)
