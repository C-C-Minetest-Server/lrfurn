-- lrfurn/src/endtable.lua
-- End Table
--[[
    Living Room Furniture by thefamilygrog66 and 1F616EMO
    is marked with CC0 1.0. To view a copy of this license,
    visit http://creativecommons.org/publicdomain/zero/1.0
]]

local S = minetest.get_translator("lrfurn")

minetest.register_node("lrfurn:endtable", {
	description = S("End Table"),
	drawtype = "nodebox",
	tiles = { "lrfurn_coffeetable_back.png", "lrfurn_coffeetable_back.png", "lrfurn_coffeetable_back.png", "lrfurn_coffeetable_back.png", "lrfurn_coffeetable_back.png", "lrfurn_coffeetable_back.png" },
	paramtype = "light",
	paramtype2 = "facedir",
	stack_max = 1,
	groups = { snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	sounds = default.node_sound_wood_defaults(),
	use_texture_alpha = "opaque",
	node_box = {
		type = "fixed",
		fixed = {
			--legs
			{ -0.375,  -0.5,    -0.375,  -0.3125, -0.0625, -0.3125 },
			{ 0.3125,  -0.5,    -0.375,  0.375,   -0.0625, -0.3125 },
			{ -0.375,  -0.5,    0.3125,  -0.3125, -0.0625, 0.375 },
			{ 0.3125,  -0.5,    0.3125,  0.375,   -0.0625, 0.375 },

			--tabletop
			{ -0.4375, -0.0625, -0.4375, 0.4375,  0,       0.4375 },
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.4375, -0.5, -0.4375, 0.4375, 0.0, 0.4375 },
		}
	},
})

minetest.register_craft({
	output = "lrfurn:endtable",
	recipe = {
		{ "stairs:slab_wood", "stairs:slab_wood", },
		{ "default:stick",    "default:stick", }
	}
})
