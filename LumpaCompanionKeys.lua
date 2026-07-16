BINDING_HEADER_LCK_BASIC = "LumpaCompanionKeys - Basic"
BINDING_HEADER_LCK_ADVANCED = "LumpaCompanionKeys - Advanced"
BINDING_HEADER_LCK_CUSTOM = "LumpaCompanionKeys - Custom"

local PLAYER_NAME = UnitName("player")

local BUTTON_TOP_OFFSET = 16
local BUTTON_LEFT_PADDING = 8
local RIGHT_PADDING = 8
local BOTTOM_PADDING = 8
local SECTION_GAP = 8
local ICON_ZOOM = 0.08



-- SECTIONS
local LCKSections = {
	aura = {
		size = 16,
		spacing = 0,
		maxRow = 0,
		maxCol = 0,
		startY = 0,
	},
	totem = {
		size = 24,
		spacing = 0,
		maxRow = 0,
		maxCol = 0,
		startY = 0,
	},
	utility = {
		size = 24,
		spacing = 0,
		maxRow = 0,
		maxCol = 0,
		startY = 0,
	},
	gear = {
		size = 19.2,
		spacing = 0,
		maxRow = 0,
		maxCol = 0,
		startY = 0,
	},
}
local LCKSectionOrder = {
	"aura",
	"totem",
	"utility",
	"gear",
}



-- HELPERS
local function LCK_ClassMatches(unitClass, classes)
	if not classes then return true end
	for _, class in ipairs(classes) do
		if unitClass==class then return true end
	end
	return false
end

function ClearTargetIfFriendly()
	if UnitExists("target") and UnitIsFriend("player", "target") then ClearTarget() end
end

local function LCK_FormatCommand(command)
	if type(command) == "table" then return table.concat(command, "\n") end
	return command
end



-- DEBUGGING
function LCK_PrintBuffs()
	local i = 1
	while true do
		local texture, count, debuffType, duration, expirationTime = UnitBuff("player", i)
		if not texture then break end
		DEFAULT_CHAT_FRAME:AddMessage("Buff "..i..": "..texture)
		i = i + 1
	end
end



-- DELIVER PAYLOAD
function LCK_Command(cmd)
	ClearTargetIfFriendly()
	SendChatMessage(cmd, "PARTY")
end
function LCK_WhisperCommand(commands, classes)
	local function SendCommands(name)
		if not name then return end
		if name == PLAYER_NAME then return end

		if type(commands) == "table" then
			for _, cmd in ipairs(commands) do SendChatMessage(cmd, "WHISPER", nil, name) end
		else
			SendChatMessage(commands, "WHISPER", nil, name)
		end
	end

	-- if we have a friendly target -> whisper ONLY them
	if UnitExists("target") and UnitIsPlayer("target") and UnitIsFriend("player", "target") then
		local name = UnitName("target")
		if name then SendCommands(name) end
		return
	end

	-- raid
	local raid = GetNumRaidMembers()
	if raid > 0 then
		for i = 1, raid do
			local unit = "raid"..i
			local _, unitClass = UnitClass(unit)
			if LCK_ClassMatches(unitClass, classes) then SendCommands(UnitName(unit)) end
		end
		return
	end

	-- party
	local party = GetNumPartyMembers()
	if party > 0 then
		for i = 1, party do
			local unit = "party"..i
			local _, unitClass = UnitClass(unit)
			if LCK_ClassMatches(unitClass, classes) then SendCommands(UnitName(unit)) end
		end
	end
end



-- MAIN FRAME
local LCKFrame = CreateFrame("Frame", "LCKFrame", UIParent)
LCKFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

LCKFrame:SetBackdrop({
	bgFile = "Interface\\Buttons\\WHITE8x8",
	edgeFile = "Interface\\Buttons\\WHITE8x8",
	tile = true,
	tileSize = 16,
	edgeSize = 1,
	insets = {
		left = 1,
		right = 1,
		top = 1,
		bottom = 1,
	}
})
LCKFrame:SetBackdropColor(0.05, 0.05, 0.05, 1.0)
LCKFrame:SetBackdropBorderColor(.3, .3, .3, 1.0)

LCKFrame:EnableMouse(true)
LCKFrame:SetMovable(true)
LCKFrame:RegisterForDrag("LeftButton")

LCKFrame:SetScript("OnDragStart", function()
	this:StartMoving()
end)

LCKFrame:SetScript("OnDragStop", function()
	this:StopMovingOrSizing()
end)

LCKFrame:Hide()

-- assign text
local assignText = LCKFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal") -- GameFontHighlightSmall, GameFontNormal
assignText:SetPoint("TOP", 0, -2)
assignText:SetText("< EVERYONE >")
local function LCK_UpdateAssignText()
	if UnitExists("target") and UnitIsPlayer("target") and UnitIsFriend("player", "target") then
		local name = UnitName("target")
		if name then
			local _, class = UnitClass("target")
			local color = RAID_CLASS_COLORS[class]
			if color and color.colorStr then
				assignText:SetText("< |c"..color.colorStr..name.."|r >")
			else
				assignText:SetText("< "..name.." >")
			end
			return
		end
	end

	assignText:SetText("< EVERYONE >")
end
local LCKEventFrame = CreateFrame("Frame")
LCKEventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
LCKEventFrame:SetScript("OnEvent", function()
	LCK_UpdateAssignText()
end)



-- SLASH COMMANDS
SLASH_LCK1 = "/lck"
SlashCmdList["LCK"] = function(msg)
	if LCKFrame:IsShown() then
		LCKFrame:Hide()
	else
		LCKFrame:Show()
	end
end

SLASH_LCKBUFFS1 = "/lckbuffs"
SlashCmdList["LCKBUFFS"] = function(msg)
	LCK_PrintBuffs()
end



-- MINIMAP BUTTON
local LCKMinimapButton = CreateFrame("Button", "LCKMinimapButton", Minimap)
LCKMinimapButton:SetWidth(31)
LCKMinimapButton:SetHeight(31)
LCKMinimapButton:SetFrameStrata("MEDIUM")
LCKMinimapButton:SetMovable(true)
LCKMinimapButton:RegisterForDrag("LeftButton")

local LCKMinimapAngle = 220

local function LCK_UpdateMinimapPosition()
	local x = math.cos(math.rad(LCKMinimapAngle)) * 80
	local y = math.sin(math.rad(LCKMinimapAngle)) * 80

	LCKMinimapButton:ClearAllPoints()
	LCKMinimapButton:SetPoint("CENTER", Minimap, "CENTER", x, y)
end

LCK_UpdateMinimapPosition()

-- Icon
local icon = LCKMinimapButton:CreateTexture(nil, "ARTWORK")
icon:SetTexture("Interface\\Icons\\INV_Shield_04")
icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
icon:SetWidth(24)
icon:SetHeight(24)
icon:SetPoint("CENTER", LCKMinimapButton, "CENTER", 0, 0)

-- Highlight
LCKMinimapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

-- Toggle panel
LCKMinimapButton:SetScript("OnClick", function()
	if LCKFrame:IsShown() then
		LCKFrame:Hide()
	else
		LCKFrame:Show()
	end
end)

-- Drag around minimap
LCKMinimapButton:SetScript("OnDragStart", function()
	this:SetScript("OnUpdate", function()
		local mx, my = Minimap:GetCenter()
		local x, y = GetCursorPosition()
		local scale = UIParent:GetEffectiveScale()

		if not mx or not my then return end

		x = x / scale
		y = y / scale

		local angle = math.deg(math.atan2(y - my, x - mx))
		LCKMinimapAngle = angle

		LCK_UpdateMinimapPosition()
	end)
end)

LCKMinimapButton:SetScript("OnDragStop", function()
	this:SetScript("OnUpdate", nil)
end)

-- Tooltip
LCKMinimapButton:SetScript("OnEnter", function()
	GameTooltip:SetOwner(this, "ANCHOR_LEFT")
	GameTooltip:AddLine("LumpaCompanionKeys")
	GameTooltip:AddLine("Click to toggle panel", 1, 1, 1)
	GameTooltip:Show()
end)

LCKMinimapButton:SetScript("OnLeave", function()
	GameTooltip:Hide()
end)



-- BUTTONS
local function CreateLCKButton(sectionName, name, texture, col, row, classes, command)
	local section = LCKSections[sectionName]
	if not section then error("Unknown LCK section: "..sectionName) end
	local btn = CreateFrame("Button", name, LCKFrame)

	btn:SetWidth(section.size)
	btn:SetHeight(section.size)

	if row > section.maxRow then section.maxRow = row end
	if col > section.maxCol then section.maxCol = col end

	local x = BUTTON_LEFT_PADDING + col*(section.size+section.spacing)
	local y = section.startY - row*(section.size+section.spacing)

	btn:SetPoint("TOPLEFT", LCKFrame, "TOPLEFT", x, y)
	btn.section = sectionName
	btn.col = col
	btn.row = row

	local icon = btn:CreateTexture(nil, "ARTWORK")
	icon:SetTexture(texture)
	icon:SetTexCoord(ICON_ZOOM, 1-ICON_ZOOM, ICON_ZOOM, 1-ICON_ZOOM)
	icon:SetAllPoints(btn)

	local highlight = btn:CreateTexture(nil, "HIGHLIGHT")
	highlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
	highlight:SetBlendMode("ADD")
	highlight:SetAllPoints(btn)

	btn:SetScript("OnClick", function()
		LCK_WhisperCommand(command, classes)
	end)

	btn:SetScript("OnEnter", function()
		GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
		GameTooltip:AddLine(LCK_FormatCommand(command))
		GameTooltip:Show()
	end)

	btn:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
end



local LCKSectionFrames = {}
local function LCK_CreateSectionBorder(sectionName)
	local section = LCKSections[sectionName]
	local frame = CreateFrame("Frame", nil, LCKFrame)

	frame:SetFrameLevel(LCKFrame:GetFrameLevel() + 1)

	frame:SetBackdrop({
		edgeFile = "Interface\\Buttons\\WHITE8x8",
		edgeSize = 1,
	})
	frame:SetBackdropBorderColor(.3, .3, .3, 1.0)

	frame.section = sectionName
	LCKSectionFrames[sectionName] = frame
end
local function LCK_UpdateSectionPositions()
	local currentY = -BUTTON_TOP_OFFSET
	for i, sectionName in ipairs(LCKSectionOrder) do
		local section = LCKSections[sectionName]
		section.startY = currentY
		local height = (section.maxRow+1) * (section.size+section.spacing)
		currentY = currentY - height
		if i < table.getn(LCKSectionOrder) then currentY = currentY-SECTION_GAP end
	end
end
local function LCK_PositionSectionBorders()
	for _, sectionName in ipairs(LCKSectionOrder) do
		local section = LCKSections[sectionName]
		local frame = LCKSectionFrames[sectionName]

		if frame then
			local width = (section.maxCol + 1) * (section.size + section.spacing)
			local height = (section.maxRow + 1) * (section.size + section.spacing)

			frame:SetWidth(width + 2)
			frame:SetHeight(height + 2)

			frame:ClearAllPoints()
			frame:SetPoint("TOPLEFT", LCKFrame, "TOPLEFT", BUTTON_LEFT_PADDING-1, section.startY+1)

			frame:Show()
		end
	end
end
local function LCK_RepositionButtons()
	for _, child in ipairs({LCKFrame:GetChildren()}) do
		if child.section and child.col and child.row then
			local section = LCKSections[child.section]
			local col = child.col
			local row = child.row

			child:SetPoint(
				"TOPLEFT",
				LCKFrame,
				"TOPLEFT",
				BUTTON_LEFT_PADDING + col*(section.size+section.spacing),
				section.startY - row*(section.size+section.spacing)
			)
		end
	end
end


-- PALADIN AURAS
CreateLCKButton("aura", "LCKAuraDevotion",              "Interface\\Icons\\Spell_Holy_DevotionAura",              0, 0, {"PALADIN"}, "cast Devotion Aura")
CreateLCKButton("aura", "LCKAuraRetribution",           "Interface\\Icons\\Spell_Holy_AuraOfLight",               1, 0, {"PALADIN"}, "cast Retribution Aura")
CreateLCKButton("aura", "LCKAuraConcentration",         "Interface\\Icons\\Spell_Holy_MindSooth",                 2, 0, {"PALADIN"}, "cast Concentration Aura")
CreateLCKButton("aura", "LCKAuraShadowResistance",      "Interface\\Icons\\Spell_Shadow_SealOfKings",             3, 0, {"PALADIN"}, "cast Shadow Resistance Aura")
CreateLCKButton("aura", "LCKAuraFrostResistance",       "Interface\\Icons\\Spell_Frost_WizardMark",               4, 0, {"PALADIN"}, "cast Frost Resistance Aura")
CreateLCKButton("aura", "LCKAuraFireResistance",        "Interface\\Icons\\Spell_Fire_SealOfFire",                5, 0, {"PALADIN"}, "cast Fire Resistance Aura")

-- SHAMAN TOTEMS: earth
CreateLCKButton("totem", "LCKTotemStrengthOfEarth",     "Interface\\Icons\\Spell_Nature_EarthBindTotem",          0, 0, {"SHAMAN"}, {"cast Strength of Earth Totem", "set totem Strength of Earth Totem"})
CreateLCKButton("totem", "LCKTotemStoneskin",           "Interface\\Icons\\Spell_Nature_StoneSkinTotem",          1, 0, {"SHAMAN"}, {"cast Stoneskin Totem", "set totem Stoneskin Totem"})
CreateLCKButton("totem", "LCKTotemEarthbind",           "Interface\\Icons\\Spell_Nature_StrengthOfEarthTotem02",  2, 0, {"SHAMAN"}, {"cast Earthbind Totem", "set totem Earthbind Totem"})
CreateLCKButton("totem", "LCKTotemTremor",              "Interface\\Icons\\Spell_Nature_TremorTotem",             3, 0, {"SHAMAN"}, {"cast Tremor Totem", "set totem Tremor Totem"})
CreateLCKButton("totem", "LCKTotemStoneclaw",           "Interface\\Icons\\spell_nature_stoneclawtotem",          4, 0, {"SHAMAN"}, {"cast Stoneclaw Totem", "set totem Stoneclaw Totem"})

-- SHAMAN TOTEMS: fire
CreateLCKButton("totem", "LCKTotemSearing",             "Interface\\Icons\\spell_fire_searingTotem",              0, 1, {"SHAMAN"}, {"cast Searing Totem", "set totem Searing Totem"})
CreateLCKButton("totem", "LCKTotemMagma",               "Interface\\Icons\\Spell_Fire_SelfDestruct",              1, 1, {"SHAMAN"}, {"cast Magma Totem", "set totem Magma Totem"})
CreateLCKButton("totem", "LCKTotemFlametongue",         "Interface\\Icons\\Spell_Nature_GuardianWard",            2, 1, {"SHAMAN"}, {"cast Flametongue Totem", "set totem Flametongue Totem"})
CreateLCKButton("totem", "LCKTotemFireNova",            "Interface\\Icons\\spell_fire_sealoffire",                3, 1, {"SHAMAN"}, {"cast Fire Nova Totem", "set totem Fire Nova Totem"})
CreateLCKButton("totem", "LCKTotemFrostResistance",     "Interface\\Icons\\spell_frostresistancetotem_01",        4, 1, {"SHAMAN"}, {"cast Frost Resistance Totem", "set totem Frost Resistance Totem"})

-- SHAMAN TOTEMS: water
CreateLCKButton("totem", "LCKTotemHealingStream",       "Interface\\Icons\\INV_Spear_04",                         0, 2, {"SHAMAN"}, {"cast Healing Stream Totem", "set totem Healing Stream Totem"})
CreateLCKButton("totem", "LCKTotemManaSpring",          "Interface\\Icons\\Spell_Nature_ManaRegenTotem",          1, 2, {"SHAMAN"}, {"cast Mana Spring Totem", "set totem Mana Spring Totem"})
CreateLCKButton("totem", "LCKTotemPoisonCleansing",     "Interface\\Icons\\Spell_Nature_NullifyPoison",           2, 2, {"SHAMAN"}, {"cast Poison Cleansing Totem", "set totem Poison Cleansing Totem"})
CreateLCKButton("totem", "LCKTotemDiseaseCleansing",    "Interface\\Icons\\Spell_Nature_RemoveDisease",           3, 2, {"SHAMAN"}, {"cast Disease Cleansing Totem", "set totem Disease Cleansing Totem"})
CreateLCKButton("totem", "LCKTotemFireResistance",      "Interface\\Icons\\Spell_FireResistanceTotem_01",         4, 2, {"SHAMAN"}, {"cast Fire Resistance Totem", "set totem Fire Resistance Totem"})

-- SHAMAN TOTEMS: air
CreateLCKButton("totem", "LCKTotemWindfury",            "Interface\\Icons\\Spell_Nature_Cyclone",                 0, 3, {"SHAMAN"}, {"cast Windfury Totem", "set totem Windfury Totem"})
CreateLCKButton("totem", "LCKTotemGraceOfAir",          "Interface\\Icons\\Spell_Nature_InvisibilityTotem",       1, 3, {"SHAMAN"}, {"cast Grace of Air Totem", "set totem Grace of Air Totem"})
CreateLCKButton("totem", "LCKTotemTranquilAir",         "Interface\\Icons\\spell_nature_brilliance",              2, 3, {"SHAMAN"}, {"cast Tranquil Air Totem", "set totem Tranquil Air Totem"})
CreateLCKButton("totem", "LCKTotemGrounding",           "Interface\\Icons\\Spell_Nature_GroundingTotem",          3, 3, {"SHAMAN"}, {"cast Grounding Totem", "set totem Grounding Totem"})
CreateLCKButton("totem", "LCKTotemNatureResistance",    "Interface\\Icons\\Spell_Nature_NatureResistanceTotem",   4, 3, {"SHAMAN"}, {"cast Nature Resistance Totem", "set totem Nature Resistance Totem"})
CreateLCKButton("totem", "LCKTotemWindwall",            "Interface\\Icons\\spell_nature_earthbind",               5, 3, {"SHAMAN"}, {"cast Windwall Totem", "set totem Windwall Totem"})

-- PETS
CreateLCKButton("utility", "LCKPetOn",                  "Interface\\Icons\\Ability_Hunter_BeastCall",             0, 0, {"HUNTER", "WARLOCK"}, "set pet on")
CreateLCKButton("utility", "LCKPetOff",                 "Interface\\Icons\\Spell_shadow_sacrificialshield",       0, 1, {"HUNTER", "WARLOCK"}, "set pet off")

-- DENY
CreateLCKButton("utility", "LCKTotemSearing_Allow",     "Interface\\Icons\\Spell_Fire_SearingTotem",              1, 0, {"SHAMAN"}, "deny remove Searing Totem")
CreateLCKButton("utility", "LCKTotemSearing_Deny",      "Interface\\Icons\\Spell_shadow_sacrificialshield",       1, 1, {"SHAMAN"}, "deny add Searing Totem")
CreateLCKButton("utility", "LCKAmplifyMagic_Allow",     "Interface\\Icons\\Spell_Holy_FlashHeal",                 2, 0, {"MAGE"}, "deny remove Amplify Magic")
CreateLCKButton("utility", "LCKAmplifyMagic_Deny",      "Interface\\Icons\\Spell_shadow_sacrificialshield",       2, 1, {"MAGE"}, "deny add Amplify Magic")
CreateLCKButton("utility", "LCKDampenMagic_Allow",      "Interface\\Icons\\spell_nature_abolishmagic",            3, 0, {"MAGE"}, "deny remove Dampen Magic")
CreateLCKButton("utility", "LCKDampenMagic_Deny",       "Interface\\Icons\\Spell_shadow_sacrificialshield",       3, 1, {"MAGE"}, "deny add Dampen Magic")
CreateLCKButton("utility", "LCKReincarnation_Allow",    "Interface\\Icons\\spell_nature_reincarnation",           4, 0, {"SHAMAN"}, "deny remove Reincarnation")
CreateLCKButton("utility", "LCKReincarnation_Deny",     "Interface\\Icons\\Spell_shadow_sacrificialshield",       4, 1, {"SHAMAN"}, "deny add Reincarnation")

-- SET GEAR
CreateLCKButton("gear", "LCKGear_Normal",               "Interface\\Icons\\inv_shield_04",                        0, 0, nil, "set gear normal")
CreateLCKButton("gear", "LCKGear_Fire",                 "Interface\\Icons\\spell_fire_fireball",                  1, 0, nil, "set gear fire")
CreateLCKButton("gear", "LCKGear_Nature",               "Interface\\Icons\\spell_nature_protectionformnature",    2, 0, nil, "set gear nature")
CreateLCKButton("gear", "LCKGear_Frost",                "Interface\\Icons\\spell_frost_frostarmor02",             3, 0, nil, "set gear frost")
CreateLCKButton("gear", "LCKGear_Shadow",               "Interface\\Icons\\spell_holy_prayerofshadowprotection",  4, 0, nil, "set gear shadow")



-- CREATE SECTION BORDERS AFTER BUTTONS EXIST
for _, sectionName in ipairs(LCKSectionOrder) do
	LCK_CreateSectionBorder(sectionName)
end



-- DYNAMIC FRAME SIZE
local function LCK_UpdateFrameSize()
	local width = 0
	local height = BUTTON_TOP_OFFSET + BOTTOM_PADDING

	for i, sectionName in ipairs(LCKSectionOrder) do
		local section = LCKSections[sectionName]
		local sectionWidth = BUTTON_LEFT_PADDING + (section.maxCol+1) * (section.size+section.spacing)
		local sectionHeight = (section.maxRow+1) * (section.size+section.spacing)

		if sectionWidth > width then width = sectionWidth end
		height = height + sectionHeight
		if i < table.getn(LCKSectionOrder) then height = height+SECTION_GAP end
	end

	LCKFrame:SetWidth(width + RIGHT_PADDING)
	LCKFrame:SetHeight(height)
end

LCK_UpdateSectionPositions()
LCK_UpdateFrameSize()
LCK_PositionSectionBorders()
LCK_RepositionButtons()