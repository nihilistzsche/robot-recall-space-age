-- local entity = table.deepcopy(data.raw["logistic-container"]["logistic-chest-requester"])

local baseEnt = data.raw["logistic-container"]["passive-provider-chest"]

local entity = table.deepcopy(baseEnt)
entity.name = "robot-redistribute-chest"
entity.order = "logistic-container"
entity.minable = { mining_time = 0.1, result = "robot-redistribute-chest" }
entity.logistic_mode = "requester"
entity.inventory_size = 40
entity.max_logistic_slots = 40
entity.icon_size = 64
entity.max_health = 350
entity.icon = "__robot-recall-space-age__/graphics/icons/robot-redistribute-chest.png"
entity.open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume = 0.5 }
entity.close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.5 }
entity.animation_sound = baseEnt.animation_sound
entity.opened_duration = baseEnt.opened_duration
entity.collision_box = { { -0.35, -0.35 }, { 0.35, 0.35 } }
entity.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
entity.damaged_trigger_effect = baseEnt.damaged_trigger_effect
entity.type = "logistic-container"
entity.animation = {
	layers = {
		{
			filename = "__robot-recall-space-age__/graphics/entity/robot-redistribute-chest.png",
			priority = "extra-high",
			width = 66,
			height = 74,
			frame_count = 7,
			shift = util.by_pixel(0, -2),
			scale = 0.5,
		},
		{
			filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
			priority = "extra-high",
			width = 96,
			height = 44,
			repeat_count = 7,
			shift = util.by_pixel(8.5, 5),
			draw_as_shadow = true,
			scale = 0.5,
		},
	},
}

entity.flags = { "placeable-player", "player-creation" }

local item = table.deepcopy(data.raw.item["requester-chest"])
item.name = "robot-redistribute-chest"
-- item.entity = "robot-redistribute-chest"
item.place_result = "robot-redistribute-chest"
item.icon_size = 64
item.icons = {
	{
		icon = "__robot-recall-space-age__/graphics/icons/robot-redistribute-chest.png",
		-- tint = { r = 0.5, g = 0.5, b = 0.5, a = 1}
	},
}

local recipe = table.deepcopy(data.raw.recipe["requester-chest"])
recipe.enabled = false
recipe.name = "robot-redistribute-chest"
recipe.results = { { type = "item", name = "robot-redistribute-chest", amount = 1 } }

table.insert(
	data.raw["technology"]["construction-robotics"].effects,
	{ type = "unlock-recipe", recipe = "robot-redistribute-chest" }
)
table.insert(
	data.raw["technology"]["logistic-robotics"].effects,
	{ type = "unlock-recipe", recipe = "robot-redistribute-chest" }
)

if __DebugAdapter then
	local variables = require("__debugadapter__/variables.lua")

	-- prepare debug metatables here
end
data:extend({ item, entity, recipe })
