-- Full credit to ImagineNothing for the Gun Van Halen script on UC, which is the inspiration for this and the source of all the values.
local valid_weapons <const>    = {
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_SMG",
	"WEAPON_MICROSMG",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_CARBINERIFLE",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_RPG",
	"WEAPON_MINIGUN",
	"WEAPON_KNIFE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_CROWBAR",
	"WEAPON_GOLFCLUB",
	"WEAPON_ASSAULTSMG",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_BOTTLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_SNSPISTOL",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_GUSENBERG",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_DAGGER",
	"WEAPON_MUSKET",
	"WEAPON_FIREWORK",
	"WEAPON_FLAREGUN",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_HATCHET",
	"WEAPON_COMBATPDW",
	"WEAPON_KNUCKLE",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_MACHETE",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_DBSHOTGUN",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_FLASHLIGHT",
	"WEAPON_REVOLVER",
	"WEAPON_SWITCHBLADE",
	"WEAPON_AUTOSHOTGUN",
	"WEAPON_MINISMG",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_BATTLEAXE",
	"WEAPON_POOLCUE",
	"WEAPON_WRENCH",
	"WEAPON_DOUBLEACTION",
	"WEAPON_RAYPISTOL",
	"WEAPON_RAYCARBINE",
	"WEAPON_RAYMINIGUN",
	"WEAPON_STONE_HATCHET",
	"WEAPON_NAVYREVOLVER",
	"WEAPON_CERAMICPISTOL",
	"WEAPON_GADGETPISTOL",
	"WEAPON_MILITARYRIFLE",
	"WEAPON_COMBATSHOTGUN",
	"WEAPON_HEAVYRIFLE",
	"WEAPON_EMPLAUNCHER",
	"WEAPON_STUNGUN_MP",
	"WEAPON_TACTICALRIFLE",
	"WEAPON_PRECISIONRIFLE",
	"WEAPON_PISTOLXM3",
	"WEAPON_CANDYCANE",
	"WEAPON_RAILGUNXM3",
	"WEAPON_TECPISTOL",
	"WEAPON_BATTLERIFLE",
	"WEAPON_SNOWLAUNCHER",
	"WEAPON_STUNROD",
	"WEAPON_STRICKLER",
}

local valid_throwables <const> = {
	"WEAPON_GRENADE",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_STICKYBOMB",
	"WEAPON_MOLOTOV",
	"WEAPON_PROXMINE",
	"WEAPON_PIPEBOMB",
	"WEAPON_PETROLCAN",
}

local gunvanlocs               = {
	[1]  = { name = "Paleto Bay", coords = vec3:new(-29.532, 6435.136, 31.162) },
	[2]  = { name = "Grapeseed", coords = vec3:new(1705.214, 4819.167, 41.75) },
	[3]  = { name = "Sandy Shores", coords = vec3:new(1795.522, 3899.753, 33.869) },
	[4]  = { name = "Grand Senora Desert", coords = vec3:new(1335.536, 2758.746, 51.099) },
	[5]  = { name = "Vinewood Sign", coords = vec3:new(795.583, 1210.78, 338.962) }, -- *Galileo Park - Vinewood Hills
	[6]  = { name = "Chumash", coords = vec3:new(-3192.67, 1077.205, 20.594) },
	[7]  = { name = "Paleto Forest", coords = vec3:new(-789.719, 5400.921, 33.915) },
	[8]  = { name = "Zancudo River", coords = vec3:new(-24.384, 3048.167, 40.703) },
	[9]  = { name = "Power Station", coords = vec3:new(2666.786, 1469.324, 24.237) },  -- *Palmer-Taylor Power Station
	[10] = { name = "Lago Zancudo", coords = vec3:new(-1454.966, 2667.503, 3.2) },     -- *Fort Zancudo Approach Rd
	[11] = { name = "Thomson Scrapyard", coords = vec3:new(2340.418, 3054.188, 47.888) },
	[12] = { name = "El Burro Heights", coords = vec3:new(1509.183, -2146.795, 76.853) }, -- *Car Scrapyard
	[13] = { name = "Murrieta Heights", coords = vec3:new(1137.404, -1358.654, 34.322) },
	[14] = { name = "Elysian Island", coords = vec3:new(-57.208, -2658.793, 5.737) },
	[15] = { name = "Tataviam Mountains", coords = vec3:new(1905.017, 565.222, 175.558) }, -- *Land Act Reservoir
	[16] = { name = "La Mesa", coords = vec3:new(974.484, -1718.798, 30.296) },         -- *Fridgit, Forced Labor Place
	[17] = { name = "Terminal", coords = vec3:new(779.077, -3266.297, 5.719) },
	[18] = { name = "La Puerta", coords = vec3:new(-587.728, -1637.208, 19.611) },      -- *Rogers Salvage & Scrap
	[19] = { name = "La Mesa", coords = vec3:new(733.99, -736.803, 26.165) },           -- *Popular Street
	[20] = { name = "Del Perro", coords = vec3:new(-1694.632, -454.082, 40.712) },
	[21] = { name = "Magellan Ave", coords = vec3:new(-1330.726, -1163.948, 4.313) },   -- *Vespucci Beach
	[22] = { name = "West Vinewood", coords = vec3:new(-496.618, 40.231, 52.316) },
	[23] = { name = "Downtown Vinewood", coords = vec3:new(275.527, 66.509, 94.108) },
	[24] = { name = "Pillbox Hill", coords = vec3:new(260.928, -763.35, 30.559) },
	[25] = { name = "Little Seoul", coords = vec3:new(-478.025, -741.45, 30.299) }, -- *Caesars Auto Parking
	[26] = { name = "Alamo Sea", coords = vec3:new(894.94, 3603.911, 32.56) },      -- *Joshua Road
	[27] = { name = "North Chumash", coords = vec3:new(-2166.511, 4289.503, 48.733) }, -- *Hookies
	[28] = { name = "Mount Chiliad", coords = vec3:new(1465.633, 6553.67, 13.771) }, -- *Procopio Beach
	[29] = { name = "Mirror Park", coords = vec3:new(1101.032, -335.172, 66.944) }, -- *Hearty Taco
	[30] = { name = "Davis", coords = vec3:new(149.683, -1655.674, 29.028) }        -- *Bishop's Chicken
}

---@enum eBlipDisplayType
Enums.eBlipDisplayType         = {
	BOTH = 2,
	MAIN = 3,
	MINI = 5,
}

---@class WeaponDataItem
---@field model_name string
---@field group string
---@field gxt string
---@field display_name string

---@class GunVanEditor
---@field m_weapon_data table<hash, WeaponDataItem>
---@field m_valid_weapons array<string>
---@field m_valid_throwables array<string>
---@field m_custom_blip blip
---@field m_tab Tab
local GunVanEditor             = {}
GunVanEditor.__index           = GunVanEditor
GunVanEditor.__label           = "GunVanitor"

---@return GunVanEditor
function GunVanEditor:init()
	local instance = setmetatable({
		m_weapon_data = require("includes.data.weapon_data"),
		m_valid_weapons = valid_weapons,
		m_valid_throwables = valid_throwables
	}, self)

	if (Game.IsOnline()) then
		instance:CreateBlip()
	end

	Backend:RegisterEventCallback(Enums.eBackendEvent.SESSION_SWITCH, function()
		instance:RemoveBlip()
		instance:CreateBlip()
	end)

	Backend:RegisterEventCallback(Enums.eBackendEvent.RELOAD_UNLOAD, function()
		instance:RemoveBlip()
	end)



	return instance
end

function GunVanEditor:CreateBlip()
	ThreadManager:Run(function()
		if (not GVars.features.mastermind.gv_map) then
			return
		end
		while (Game.IsInNetworkTransition()) do
			yield()
		end
		local blip -- = HUD.GET_FIRST_BLIP_INFO_ID(844)
		if (not self.m_custom_blip) then
			sleep(500)
			local location = self:GetVanLocation().coords
			blip = HUD.ADD_BLIP_FOR_COORD(location.x, location.y, location.z)
			HUD.SET_BLIP_SPRITE(blip, 844)
			HUD.SET_BLIP_HIGH_DETAIL(blip, false)
			HUD.SET_BLIP_DISPLAY(blip, Enums.eBlipDisplayType.BOTH)
			HUD.SET_BLIP_AS_SHORT_RANGE(blip, not GVars.features.mastermind.gv_minimap)
			HUD.SET_BLIP_FLASH_TIMER(blip, 3000)
			self.m_custom_blip = blip
			Notifier:ShowMessage(self.__label, "Van location added to map.")
		end
	end)
end

function GunVanEditor:UpdateBlipRange()
	ThreadManager:Run(function()
		HUD.SET_BLIP_AS_SHORT_RANGE(self.m_custom_blip, not GVars.features.mastermind.gv_minimap)
	end)
end

function GunVanEditor:RemoveBlip()
	ThreadManager:Run(function()
		if (HUD.DOES_BLIP_EXIST(self.m_custom_blip)) then
			HUD.REMOVE_BLIP(self.m_custom_blip)
		end
		self.m_custom_blip = nil
	end)
end

function GunVanEditor:SetWeapon(slot, hash)
	local item = self.m_weapon_data[hash]
	if (item) then
		local name = item.display_name
		tunables.set_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. slot, hash)
		Notifier:ShowMessage(self.__label, _F("Weapon slot %d set to %s", slot + 1, name))
	end
end

function GunVanEditor:SetThrowable(slot, hash)
	local item = self.m_weapon_data[hash]
	if (item) then
		local name = item.display_name
		tunables.set_int("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_" .. slot, hash)
		Notifier:ShowMessage(self.__label, _F("Throwable slot %d set to %s", slot + 1, name))
	end
end

function GunVanEditor:GetVanLocation()
	return gunvanlocs[STATS.GET_PACKED_STAT_INT_CODE(41239, -1) + 1]
end

return GunVanEditor
