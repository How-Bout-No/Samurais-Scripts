-- Credit to ImagineNothing for the Gun Van Halen script on UC
local GVE = require("includes.features.GunVanEditor"):init()

local current_weapon, current_throwable

local function DrawGVE()
	if (not current_weapon or not current_throwable) then
		current_weapon    = GVE.m_weapon_data[tunables.get_uint("XM22_GUN_VAN_SLOT_WEAPON_TYPE_0")]
		current_throwable = GVE.m_weapon_data[tunables.get_uint("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_0")]
	end
	local location = GVE:GetVanLocation()
	ImGui.Text(_F("Current Location: %s", location.name))
	local coords = location.coords

	if (GUI:Button(_T("GENERIC_TELEPORT"))) then
		LocalPlayer:Teleport(coords, false)
	end

	ImGui.SameLine()
	if (GUI:Button(_T("GENERIC_SET_WAYPOINT"))) then
		Game.SetWaypointCoords(coords)
	end

	GUI:HeaderText("Items", { separator = true, spacing = true })

	if (ImGui.BeginCombo("Weapon Slot 1", current_weapon.display_name)) then
		for _, value in ipairs(GVE.m_valid_weapons) do
			local hash = _J(value)
			local weapon = GVE.m_weapon_data[hash]
			local is_selected = (current_weapon == weapon)
			if (ImGui.Selectable(weapon.display_name, is_selected)) then
				current_weapon = weapon
				GVE:SetWeapon(0, hash)
			end
			if (is_selected) then
				ImGui.SetItemDefaultFocus()
			end
		end
		ImGui.EndCombo()
	end

	if (ImGui.BeginCombo("Throwable Slot 1", current_throwable.display_name)) then
		for _, value in ipairs(GVE.m_valid_throwables) do
			local hash = _J(value)
			local weapon = GVE.m_weapon_data[hash]
			local is_selected = (current_throwable == weapon)
			if (ImGui.Selectable(weapon.display_name, is_selected)) then
				current_throwable = weapon
				GVE:SetThrowable(0, hash)
			end
			if (is_selected) then
				ImGui.SetItemDefaultFocus()
			end
		end
		ImGui.EndCombo()
	end

	GUI:HeaderText("Options", { separator = true, spacing = true })

	local map_toggle
	GVars.features.mastermind.gv_map, map_toggle = GUI:CustomToggle(
		"Show Van Blip On Map",
		GVars.features.mastermind.gv_map
	)

	if (map_toggle) then
		if (GVars.features.mastermind.gv_map) then
			GVE:CreateBlip()
		else
			GVE:RemoveBlip()
		end
	end

	ImGui.BeginDisabled(not GVars.features.mastermind.gv_map)
	local minimap_toggle
	GVars.features.mastermind.gv_minimap, minimap_toggle = GUI:CustomToggle(
		"Show Van Blip On Minimap",
		GVars.features.mastermind.gv_minimap
	)

	if (minimap_toggle) then
		GVE:UpdateBlipRange()
	end
	ImGui.EndDisabled()
end

return DrawGVE
