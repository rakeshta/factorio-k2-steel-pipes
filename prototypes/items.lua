local graphics_path = k2_steel_pipes_path .. "graphics/"

local item_sounds = require("__base__/prototypes/item_sounds")
local item_tints = require("__base__/prototypes/item-tints")

data:extend({
  {
    type = "item",
    name = "kr-steel-pipe",
    icon = graphics_path .. "icons/pipe.png",
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-aa[steel-pipe]",
    place_result = "kr-steel-pipe",
    stack_size = 50,
  },
  {
    type = "item",
    name = "kr-steel-pipe-to-ground",
    icon = graphics_path .. "icons/pipe-to-ground.png",
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-ba[steel-pipe-to-ground]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "kr-steel-pipe-to-ground",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust,
  },
  {
    type = "item",
    name = "kr-steel-pump",
    icon = graphics_path .. "icons/pump.png",
    subgroup = "energy-pipe-distribution",
    order = "b[pipe]-ca[steel-pump]",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "kr-steel-pump",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
})
