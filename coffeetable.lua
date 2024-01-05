-- lrfurn/coffeetable.lua
-- Coffee Table
--[[
    Living Room Furniture by thefamilygrog66 and 1F616EMO
    is marked with CC0 1.0. To view a copy of this license,
    visit http://creativecommons.org/publicdomain/zero/1.0
]]

local S = minetest.get_translator("lrfurn")

minetest.register_node("lrfurn:coffeetable_back", {
	description = S("Coffee Table"),
	drawtype = "nodebox",
	tiles = {
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	stack_max = 1,
	groups = { snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			--legs
			{ -0.375,  -0.5,    -0.375,  -0.3125, -0.0625, -0.3125 },
			{ 0.3125,  -0.5,    -0.375,  0.375,   -0.0625, -0.3125 },

			--tabletop
			{ -0.4375, -0.0625, -0.4375, 0.4375,  0,       0.5 },
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.4375, -0.5, -0.4375, 0.4375, 0.0, 1.4375 },
		}
	},

	on_construct = function(pos)
		local node = minetest.get_node(pos)
		local direction = minetest.facedir_to_dir(node.param2)
		local pos2 = vector.add(pos, direction)
		if minetest.get_node(pos2).name == "air" then
			minetest.set_node(pos2, {
				name = "lrfurn:coffeetable_front",
				param2 = node.param2
			})
		end
	end,

	on_destruct = function(pos)
		local node = minetest.get_node(pos)
		local direction = minetest.facedir_to_dir(node.param2)
		local pos2 = vector.add(pos, direction)
		if minetest.get_node(pos2).name == "lrfurn:coffeetable_front" then
			minetest.swap_node(pos2, { name = "air" })
		end
	end,
})

minetest.register_node("lrfurn:coffeetable_front", {
	drawtype = "nodebox",
	tiles = {
		"lrfurn_coffeetable_front.png",
		"lrfurn_coffeetable_front.png",
		"lrfurn_coffeetable_front.png",
		"lrfurn_coffeetable_front.png",
		"lrfurn_coffeetable_front.png",
		"lrfurn_coffeetable_front.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			--legs
			{ -0.375,  -0.5,    0.3125, -0.3125, -0.0625, 0.375 },
			{ 0.3125,  -0.5,    0.3125, 0.375,   -0.0625, 0.375 },

			--tabletop
			{ -0.4375, -0.0625, -0.5,   0.4375,  0,       0.4375 },
		}
	},
	pointable = false,
	diggable = false,
})

minetest.register_alias("lrfurn:coffeetable", "lrfurn:coffeetable_back")

minetest.register_craft({
	output = "lrfurn:coffeetable_back",
	recipe = {
		{ "",                 "",                 "", },
		{ "stairs:slab_wood", "stairs:slab_wood", "stairs:slab_wood", },
		{ "default:stick",    "",                 "default:stick", }
	}
})

minetest.register_craft({
	output = "lrfurn:coffeetable_back",
	recipe = {
		{ "",                     "",                     "", },
		{ "moreblocks:slab_wood", "moreblocks:slab_wood", "moreblocks:slab_wood", },
		{ "default:stick",        "",                     "default:stick", }
	}
})

minetest.register_craft({
	output = "lrfurn:coffeetable_back",
	recipe = {
		{ "",                "",                "", },
		{ "group:wood_slab", "group:wood_slab", "group:wood_slab", },
		{ "default:stick",   "",                "default:stick", }
	}
})

if minetest.settings:get("log_mods") then
	minetest.log("action", "coffeetable loaded")
end
