--
--  remnants.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 24 Dec 2024.
--

local graphics_path = k2_steel_pipes_path .. "graphics/"

data:extend({
  -- pipe remnants
  {
    type = "corpse",
    name = "kr-steel-pipe-remnants",
    icon = graphics_path .. "icons/pipe.png",
    flags = { "placeable-neutral", "not-on-map" },
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(2,
      {
        filename = graphics_path .. "pipe/remnants/pipe-remnants.png",
        width = 122,
        height = 120,
        line_length = 1,
        direction_count = 2,
        shift = util.by_pixel(1.5, 2.5), -- -0,5
        scale = 0.5
      })
  },

  -- pipe to ground remnants
  {
    type = "corpse",
    name = "kr-steel-pipe-to-ground-remnants",
    icon = graphics_path .. "icons/pipe-to-ground.png",
    flags = { "placeable-neutral", "not-on-map" },
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = graphics_path .. "pipe-to-ground/remnants/pipe-to-ground-remnants.png",
      width = 90,
      height = 80,
      line_length = 1,
      direction_count = 1,
      shift = util.by_pixel(0.5, -3),
      scale = 0.5
    }
  },

  -- pump remnants
  {
    type = "corpse",
    name = "kr-steel-pump-remnants",
    icon = graphics_path .. "icons/pump.png",
    flags = { "placeable-neutral", "not-on-map" },
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    selection_box = { { -0.5, -1 }, { 0.5, 1 } },
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
      {
        filename = graphics_path .. "pump/remnants/pump-remnants.png",
        line_length = 1,
        width = 188,
        height = 186,
        direction_count = 4,
        shift = util.by_pixel(2, 2),
        scale = 0.5
      })
  },
});
