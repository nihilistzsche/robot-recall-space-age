rr = {}
-- require('util')
require("control.robot-recall")
require("control.robot-redistribute")
-- require('')

script.on_init(function(event)
    storage.teleportQueue = {}
    storage.teleportQueueEntryCount = 0
    storage.hasChanged = false
    storage.openedGUIPlayers = {}
    storage.deploying = {}
end)

local con_tech = "construction-robotics"
local log_tech = "logistic-robotics"
if script.active_mods["lokisbotsfork"] then
    con_tech = "bots-robots-steamworks"
    log_tech = "bots-robots-steamworks"
end
script.on_configuration_changed(function(event)
    for _, force in pairs(game.forces) do
        if force.technologies[con_tech].researched or force.technologies[log_tech].researched then
            force.recipes["robot-recall-chest"].enabled = true
            force.recipes["robot-redistribute-chest"].enabled = true
        end
    end
end)
