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

script.on_configuration_changed(function(event) end)
