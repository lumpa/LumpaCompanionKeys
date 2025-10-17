BINDING_HEADER_LCK = "LumpaCompanionKeys"

-- General
BINDING_NAME_LUMPACOMPANIONKEYS_START = "Start Companions"
BINDING_NAME_LUMPACOMPANIONKEYS_STOP = "Stop Companions"
BINDING_NAME_LUMPACOMPANIONKEYS_PAUSE = "Pause All"
BINDING_NAME_LUMPACOMPANIONKEYS_UNPAUSE = "Unpause All"
BINDING_NAME_LUMPACOMPANIONKEYS_AOE = "Force AOE"
BINDING_NAME_LUMPACOMPANIONKEYS_COME = "Come"
BINDING_NAME_LUMPACOMPANIONKEYS_STAY = "Stay"
BINDING_NAME_LUMPACOMPANIONKEYS_COMESTAY = "ComeStay"
BINDING_NAME_LUMPACOMPANIONKEYS_MOVE = "Move"
BINDING_NAME_LUMPACOMPANIONKEYS_FOLLOW = "Follow"
BINDING_NAME_LUMPACOMPANIONKEYS_UNFOLLOW = "Unfollow"
BINDING_NAME_LUMPACOMPANIONKEYS_USE = "Use"
BINDING_NAME_LUMPACOMPANIONKEYS_SPREAD = "Spread"

-- Pause role
BINDING_NAME_LUMPACOMPANIONKEYS_PAUSE_TANK = "Pause Tanks"
BINDING_NAME_LUMPACOMPANIONKEYS_PAUSE_HEALER = "Pause Healers"
BINDING_NAME_LUMPACOMPANIONKEYS_PAUSE_DPS = "Pause DPS"
BINDING_NAME_LUMPACOMPANIONKEYS_PAUSE_RDPS = "Pause Ranged DPS"
BINDING_NAME_LUMPACOMPANIONKEYS_PAUSE_MDPS = "Pause Melee DPS"

-- Pause NOT role
BINDING_NAME_LUMPACOMPANIONKEYS_PAUSE_NOT_TANK = "Pause All Except Tanks"
BINDING_NAME_LUMPACOMPANIONKEYS_PAUSE_NOT_HEALER = "Pause All Except Healers"
BINDING_NAME_LUMPACOMPANIONKEYS_PAUSE_NOT_DPS = "Pause All Except DPS"
BINDING_NAME_LUMPACOMPANIONKEYS_PAUSE_NOT_RDPS = "Pause All Except Ranged DPS"
BINDING_NAME_LUMPACOMPANIONKEYS_PAUSE_NOT_MDPS = "Pause All Except Melee DPS"

-- Unpause role
BINDING_NAME_LUMPACOMPANIONKEYS_UNPAUSE_TANK = "Unpause Tanks"
BINDING_NAME_LUMPACOMPANIONKEYS_UNPAUSE_HEALER = "Unpause Healers"
BINDING_NAME_LUMPACOMPANIONKEYS_UNPAUSE_DPS = "Unpause DPS"
BINDING_NAME_LUMPACOMPANIONKEYS_UNPAUSE_RDPS = "Unpause Ranged DPS"
BINDING_NAME_LUMPACOMPANIONKEYS_UNPAUSE_MDPS = "Unpause Melee DPS"

-- Unpause NOT role
BINDING_NAME_LUMPACOMPANIONKEYS_UNPAUSE_NOT_TANK = "Unpause All Except Tanks"
BINDING_NAME_LUMPACOMPANIONKEYS_UNPAUSE_NOT_HEALER = "Unpause All Except Healers"
BINDING_NAME_LUMPACOMPANIONKEYS_UNPAUSE_NOT_DPS = "Unpause All Except DPS"
BINDING_NAME_LUMPACOMPANIONKEYS_UNPAUSE_NOT_RDPS = "Unpause All Except Ranged DPS"
BINDING_NAME_LUMPACOMPANIONKEYS_UNPAUSE_NOT_MDPS = "Unpause All Except Melee DPS"

-- Pull
BINDING_NAME_LUMPACOMPANIONKEYS_PULL_1 = "Pull in 1s"
BINDING_NAME_LUMPACOMPANIONKEYS_PULL_3 = "Pull in 3s"
BINDING_NAME_LUMPACOMPANIONKEYS_PULL_5 = "Pull in 5s"
BINDING_NAME_LUMPACOMPANIONKEYS_PULL_10 = "Pull in 10s"

-- Pull back
BINDING_NAME_LUMPACOMPANIONKEYS_PULL_BACK_1 = "Pull back in 1s"
BINDING_NAME_LUMPACOMPANIONKEYS_PULL_BACK_3 = "Pull back in 3s"
BINDING_NAME_LUMPACOMPANIONKEYS_PULL_BACK_5 = "Pull back in 5s"
BINDING_NAME_LUMPACOMPANIONKEYS_PULL_BACK_10 = "Pull back in 10s"

-- Set role
BINDING_NAME_LUMPACOMPANIONKEYS_SET_TANK = "Set Role: Tank"
BINDING_NAME_LUMPACOMPANIONKEYS_SET_HEALER = "Set Role: Healer"
BINDING_NAME_LUMPACOMPANIONKEYS_SET_DPS = "Set Role: DPS"
BINDING_NAME_LUMPACOMPANIONKEYS_SET_RDPS = "Set Role: Ranged DPS"
BINDING_NAME_LUMPACOMPANIONKEYS_SET_MDPS = "Set Role: Melee DPS"

-- Focus mark
BINDING_NAME_LUMPACOMPANIONKEYS_FOCUSMARK_SKULL = "Focus Mark: Skull"
BINDING_NAME_LUMPACOMPANIONKEYS_FOCUSMARK_CROSS = "Focus Mark: Cross"
BINDING_NAME_LUMPACOMPANIONKEYS_FOCUSMARK_CIRCLE = "Focus Mark: Circle"
BINDING_NAME_LUMPACOMPANIONKEYS_FOCUSMARK_STAR = "Focus Mark: Star"
BINDING_NAME_LUMPACOMPANIONKEYS_FOCUSMARK_SQUARE = "Focus Mark: Square"
BINDING_NAME_LUMPACOMPANIONKEYS_FOCUSMARK_TRIANGLE = "Focus Mark: Triangle"
BINDING_NAME_LUMPACOMPANIONKEYS_FOCUSMARK_DIAMOND = "Focus Mark: Diamond"
BINDING_NAME_LUMPACOMPANIONKEYS_FOCUSMARK_MOON = "Focus Mark: Moon"

-- CC mark
BINDING_NAME_LUMPACOMPANIONKEYS_CCMARK_SKULL = "CC Mark: Skull"
BINDING_NAME_LUMPACOMPANIONKEYS_CCMARK_CROSS = "CC Mark: Cross"
BINDING_NAME_LUMPACOMPANIONKEYS_CCMARK_CIRCLE = "CC Mark: Circle"
BINDING_NAME_LUMPACOMPANIONKEYS_CCMARK_STAR = "CC Mark: Star"
BINDING_NAME_LUMPACOMPANIONKEYS_CCMARK_SQUARE = "CC Mark: Square"
BINDING_NAME_LUMPACOMPANIONKEYS_CCMARK_TRIANGLE = "CC Mark: Triangle"
BINDING_NAME_LUMPACOMPANIONKEYS_CCMARK_DIAMOND = "CC Mark: Diamond"
BINDING_NAME_LUMPACOMPANIONKEYS_CCMARK_MOON = "CC Mark: Moon"

-- Toggle
BINDING_NAME_LUMPACOMPANIONKEYS_TOGGLE_AOE = "Toggle AOE"
BINDING_NAME_LUMPACOMPANIONKEYS_COMETOGGLE = "Toggle come"

-- SLASH_LCK1 = "/lck"
-- SlashCmdList["LCK"] = function(msg)
--     SendChatMessage("test " .. msg, "SAY")
-- end

-- START
function LumpaCompanionKeys_start()
    SendChatMessage(".z start", "PARTY")
end

-- STOP
function LumpaCompanionKeys_stop()
    SendChatMessage(".z stop", "PARTY")
end

-- PAUSE
function LumpaCompanionKeys_pause()
    SendChatMessage(".z pause", "PARTY")
end

function LumpaCompanionKeys_pause_tank()
    SendChatMessage(".z pause tank", "PARTY")
end
function LumpaCompanionKeys_pause_healer()
    SendChatMessage(".z pause healer", "PARTY")
end
function LumpaCompanionKeys_pause_dps()
    SendChatMessage(".z pause dps", "PARTY")
end
function LumpaCompanionKeys_pause_rdps()
    SendChatMessage(".z pause rdps", "PARTY")
end
function LumpaCompanionKeys_pause_mdps()
    SendChatMessage(".z pause mdps", "PARTY")
end

function LumpaCompanionKeys_pause_not_tank()
    SendChatMessage(".z pause tank not", "PARTY")
end
function LumpaCompanionKeys_pause_not_healer()
    SendChatMessage(".z pause healer not", "PARTY")
end
function LumpaCompanionKeys_pause_not_dps()
    SendChatMessage(".z pause dps not", "PARTY")
end
function LumpaCompanionKeys_pause_not_rdps()
    SendChatMessage(".z pause rdps not", "PARTY")
end
function LumpaCompanionKeys_pause_not_mdps()
    SendChatMessage(".z pause mdps not", "PARTY")
end

-- UNPAUSE
function LumpaCompanionKeys_unpause()
    SendChatMessage(".z unpause", "PARTY")
end

function LumpaCompanionKeys_unpause_tank()
    SendChatMessage(".z unpause tank", "PARTY")
end
function LumpaCompanionKeys_unpause_healer()
    SendChatMessage(".z unpause healer", "PARTY")
end
function LumpaCompanionKeys_unpause_dps()
    SendChatMessage(".z unpause dps", "PARTY")
end
function LumpaCompanionKeys_unpause_rdps()
    SendChatMessage(".z unpause rdps", "PARTY")
end
function LumpaCompanionKeys_unpause_mdps()
    SendChatMessage(".z unpause mdps", "PARTY")
end

function LumpaCompanionKeys_unpause_not_tank()
    SendChatMessage(".z unpause tank not", "PARTY")
end
function LumpaCompanionKeys_unpause_not_healer()
    SendChatMessage(".z unpause healer not", "PARTY")
end
function LumpaCompanionKeys_unpause_not_dps()
    SendChatMessage(".z unpause dps not", "PARTY")
end
function LumpaCompanionKeys_unpause_not_rdps()
    SendChatMessage(".z unpause rdps not", "PARTY")
end
function LumpaCompanionKeys_unpause_not_mdps()
    SendChatMessage(".z unpause mdps not", "PARTY")
end

-- PULL
function LumpaCompanionKeys_pull_1()
    SendChatMessage(".z pull 1", "PARTY")
end
function LumpaCompanionKeys_pull_3()
    SendChatMessage(".z pull 3", "PARTY")
end
function LumpaCompanionKeys_pull_5()
    SendChatMessage(".z pull 5", "PARTY")
end
function LumpaCompanionKeys_pull_10()
    SendChatMessage(".z pull 10", "PARTY")
end

-- PULL BACK
function LumpaCompanionKeys_pull_back_1()
    SendChatMessage(".z pull back 1", "PARTY")
end
function LumpaCompanionKeys_pull_back_3()
    SendChatMessage(".z pull back 3", "PARTY")
end
function LumpaCompanionKeys_pull_back_5()
    SendChatMessage(".z pull back 5", "PARTY")
end
function LumpaCompanionKeys_pull_back_10()
    SendChatMessage(".z pull back 10", "PARTY")
end

-- AOE
function LumpaCompanionKeys_aoe()
    SendChatMessage(".z aoe", "PARTY")
end

-- COME
function LumpaCompanionKeys_come()
    SendChatMessage(".z come", "PARTY")
end

function LumpaCompanionKeys_come_tank()
    SendChatMessage(".z come tank", "PARTY")
end
function LumpaCompanionKeys_come_healer()
    SendChatMessage(".z come healer", "PARTY")
end
function LumpaCompanionKeys_come_dps()
    SendChatMessage(".z dps", "PARTY")
end
function LumpaCompanionKeys_come_rdps()
    SendChatMessage(".z come rdps", "PARTY")
end
function LumpaCompanionKeys_come_mdps()
    SendChatMessage(".z come mdps", "PARTY")
end

function LumpaCompanionKeys_come_not_tank()
    SendChatMessage(".z come tank not", "PARTY")
end
function LumpaCompanionKeys_come_not_healer()
    SendChatMessage(".z come healer not", "PARTY")
end
function LumpaCompanionKeys_come_not_dps()
    SendChatMessage(".z dps not", "PARTY")
end
function LumpaCompanionKeys_come_not_rdps()
    SendChatMessage(".z come rdps not", "PARTY")
end
function LumpaCompanionKeys_come_not_mdps()
    SendChatMessage(".z come mdps not", "PARTY")
end

-- STAY
function LumpaCompanionKeys_stay()
    SendChatMessage(".z stay", "PARTY")
end

function LumpaCompanionKeys_stay_tank()
    SendChatMessage(".z stay tank", "PARTY")
end
function LumpaCompanionKeys_stay_healer()
    SendChatMessage(".z stay healer", "PARTY")
end
function LumpaCompanionKeys_stay_dps()
    SendChatMessage(".z stay dps", "PARTY")
end
function LumpaCompanionKeys_stay_rdps()
    SendChatMessage(".z stay rdps", "PARTY")
end
function LumpaCompanionKeys_stay_mdps()
    SendChatMessage(".z stay mdps", "PARTY")
end

function LumpaCompanionKeys_stay_not_tank()
    SendChatMessage(".z stay tank not", "PARTY")
end
function LumpaCompanionKeys_stay_not_healer()
    SendChatMessage(".z stay healer not", "PARTY")
end
function LumpaCompanionKeys_stay_not_dps()
    SendChatMessage(".z stay dps not", "PARTY")
end
function LumpaCompanionKeys_stay_not_rdps()
    SendChatMessage(".z stay rdps not", "PARTY")
end
function LumpaCompanionKeys_stay_not_mdps()
    SendChatMessage(".z stay mdps not", "PARTY")
end

-- COMESTAY
function LumpaCompanionKeys_stay()
    SendChatMessage(".z comestay", "PARTY")
end

function LumpaCompanionKeys_stay_tank()
    SendChatMessage(".z comestay tank", "PARTY")
end
function LumpaCompanionKeys_stay_healer()
    SendChatMessage(".z comestay healer", "PARTY")
end
function LumpaCompanionKeys_stay_dps()
    SendChatMessage(".z comestay dps", "PARTY")
end
function LumpaCompanionKeys_stay_rdps()
    SendChatMessage(".z comestay rdps", "PARTY")
end
function LumpaCompanionKeys_stay_mdps()
    SendChatMessage(".z comestay mdps", "PARTY")
end

function LumpaCompanionKeys_stay_not_tank()
    SendChatMessage(".z comestay tank not", "PARTY")
end
function LumpaCompanionKeys_stay_not_healer()
    SendChatMessage(".z comestay healer not", "PARTY")
end
function LumpaCompanionKeys_stay_not_dps()
    SendChatMessage(".z comestay dps not", "PARTY")
end
function LumpaCompanionKeys_stay_not_rdps()
    SendChatMessage(".z comestay rdps not", "PARTY")
end
function LumpaCompanionKeys_stay_not_mdps()
    SendChatMessage(".z comestay mdps not", "PARTY")
end

-- MOVE
function LumpaCompanionKeys_move()
    SendChatMessage(".z move", "PARTY")
end

function LumpaCompanionKeys_move_tank()
    SendChatMessage(".z move tank", "PARTY")
end
function LumpaCompanionKeys_move_healer()
    SendChatMessage(".z move healer", "PARTY")
end
function LumpaCompanionKeys_move_dps()
    SendChatMessage(".z move dps", "PARTY")
end
function LumpaCompanionKeys_move_rdps()
    SendChatMessage(".z move rdps", "PARTY")
end
function LumpaCompanionKeys_move_mdps()
    SendChatMessage(".z move mdps", "PARTY")
end

function LumpaCompanionKeys_move_not_tank()
    SendChatMessage(".z move tank not", "PARTY")
end
function LumpaCompanionKeys_move_not_healer()
    SendChatMessage(".z move healer not", "PARTY")
end
function LumpaCompanionKeys_move_not_dps()
    SendChatMessage(".z move dps not", "PARTY")
end
function LumpaCompanionKeys_move_not_rdps()
    SendChatMessage(".z move rdps not", "PARTY")
end
function LumpaCompanionKeys_move_not_mdps()
    SendChatMessage(".z move mdps not", "PARTY")
end

-- FOLLOW
function LumpaCompanionKeys_follow()
    SendChatMessage(".z follow", "PARTY")
end

-- UNFOLLOW
function LumpaCompanionKeys_unfollow()
    SendChatMessage(".z unfollow", "PARTY")
end

-- SET ROLE
function LumpaCompanionKeys_set_tank()
    SendChatMessage(".z set tank", "PARTY")
end
function LumpaCompanionKeys_set_healer()
    SendChatMessage(".z set healer", "PARTY")
end
function LumpaCompanionKeys_set_dps()
    SendChatMessage(".z set dps", "PARTY")
end
function LumpaCompanionKeys_set_rdps()
    SendChatMessage(".z set rdps", "PARTY")
end
function LumpaCompanionKeys_set_mdps()
    SendChatMessage(".z set mdps", "PARTY")
end

-- FOCUSMARK
function LumpaCompanionKeys_focusmark_skull()
    SendChatMessage(".z focusmark skull", "PARTY")
end
function LumpaCompanionKeys_focusmark_cross()
    SendChatMessage(".z focusmark cross", "PARTY")
end
function LumpaCompanionKeys_focusmark_circle()
    SendChatMessage(".z focusmark circle", "PARTY")
end
function LumpaCompanionKeys_focusmark_star()
    SendChatMessage(".z focusmark star", "PARTY")
end
function LumpaCompanionKeys_focusmark_square()
    SendChatMessage(".z focusmark square", "PARTY")
end
function LumpaCompanionKeys_focusmark_triangle()
    SendChatMessage(".z focusmark triangle", "PARTY")
end
function LumpaCompanionKeys_focusmark_diamond()
    SendChatMessage(".z focusmark diamond", "PARTY")
end
function LumpaCompanionKeys_focusmark_moon()
    SendChatMessage(".z focusmark moon", "PARTY")
end

-- CCMARK
function LumpaCompanionKeys_ccmark_skull()
    SendChatMessage(".z ccmark skull", "PARTY")
end
function LumpaCompanionKeys_ccmark_cross()
    SendChatMessage(".z ccmark cross", "PARTY")
end
function LumpaCompanionKeys_ccmark_circle()
    SendChatMessage(".z ccmark circle", "PARTY")
end
function LumpaCompanionKeys_ccmark_star()
    SendChatMessage(".z ccmark star", "PARTY")
end
function LumpaCompanionKeys_ccmark_square()
    SendChatMessage(".z ccmark square", "PARTY")
end
function LumpaCompanionKeys_ccmark_triangle()
    SendChatMessage(".z ccmark triangle", "PARTY")
end
function LumpaCompanionKeys_ccmark_diamond()
    SendChatMessage(".z ccmark diamond", "PARTY")
end
function LumpaCompanionKeys_ccmark_moon()
    SendChatMessage(".z ccmark moon", "PARTY")
end

-- TOGGLE AOE
function LumpaCompanionKeys_toggle_aoe()
    SendChatMessage(".z toggle aoe", "PARTY")
end

-- COME TOGGLE
function LumpaCompanionKeys_cometoggle()
    SendChatMessage(".z cometoggle", "PARTY")
end

-- USE
function LumpaCompanionKeys_use()
    SendChatMessage(".z use", "PARTY")
end

-- SPREAD
function LumpaCompanionKeys_spread()
    SendChatMessage(".z spread", "PARTY")
end