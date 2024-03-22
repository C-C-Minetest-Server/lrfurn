-- lrfurn/init.lua
-- Living Room Furnitures
--[[
    Living Room Furniture by thefamilygrog66 and 1F616EMO
    is marked with CC0 1.0. To view a copy of this license,
    visit http://creativecommons.org/publicdomain/zero/1.0
]]

local S = minetest.get_translator("lrfurn")
local pi = math.pi

lrfurn = {}

-- The facedir of the node is not that of the player
-- So we need our own converion table
local param2_to_horizontal = {
    [0] = pi * 3 / 2,
    [1] = pi,
    [2] = pi / 2,
    [3] = 0
}

-- TODO: player_api sit
function lrfurn.sofa_click(pos, node, clicker)
    if not clicker:is_player() then
        return
    end
    pos.y = pos.y - 0.5
    clicker:set_pos(pos)

    clicker:set_look_horizontal(param2_to_horizontal[node.param2 % 4])
    clicker:set_look_vertical(pi * 10 / 180)
end

dofile(minetest.get_modpath("lrfurn") .. "/longsofas.lua")
dofile(minetest.get_modpath("lrfurn") .. "/sofas.lua")
dofile(minetest.get_modpath("lrfurn") .. "/armchairs.lua")
dofile(minetest.get_modpath("lrfurn") .. "/coffeetable.lua")
dofile(minetest.get_modpath("lrfurn") .. "/endtable.lua")
