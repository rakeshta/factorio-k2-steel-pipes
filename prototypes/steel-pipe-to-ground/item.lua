--
--  item.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 31 Dec 2022.
--

local entity_graphics_path = k2_steel_pipes_path .. "graphics/steel-pipe-to-ground/"

data:extend({
  {
    type = "item",
    name = "kr-steel-pipe-to-ground",
    icon = entity_graphics_path .. "steel-pipe-to-ground-icon.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-ba[steel-pipe-to-ground]",
    place_result = "kr-steel-pipe-to-ground",
    stack_size = 50,
  },
})
