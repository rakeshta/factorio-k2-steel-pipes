--
--  entity.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 31 Dec 2022.
--

local entity_graphics_path = k2_steel_pipes_path .. "graphics/steel-pipe-to-ground/"

data:extend({
  {
    type = "pipe-to-ground",
    name = "kr-steel-pipe-to-ground",
    icon = entity_graphics_path .. "steel-pipe-to-ground-icon.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.1, result = "kr-steel-pipe-to-ground" },
    max_health = 150,
    corpse = "pipe-remnants",
    resistances = {
      {
        type = "fire",
        percent = 90,
      },
      {
        type = "impact",
        percent = 60,
      },
    },
    fast_replaceable_group = "pipe",
    collision_box = { { -0.29, -0.29 }, { 0.29, 0.2 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    fluid_box = {
      base_area = 1,
      height = 1.25,
      pipe_covers = steel_pipecoverspictures,
      pipe_connections = {
        { position = { 0, -1 } },
        {
          position = { 0, 1 },
          max_underground_distance = 30,
        },
      },
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures = {
      up = {
        filename = entity_graphics_path .. "steel-pipe-to-ground-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version = {
          filename = entity_graphics_path .. "hr-steel-pipe-to-ground-up.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
      down = {
        filename = entity_graphics_path .. "steel-pipe-to-ground-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version = {
          filename = entity_graphics_path .. "hr-steel-pipe-to-ground-down.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
      left = {
        filename = entity_graphics_path .. "steel-pipe-to-ground-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version = {
          filename = entity_graphics_path .. "hr-steel-pipe-to-ground-left.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
      right = {
        filename = entity_graphics_path .. "steel-pipe-to-ground-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version = {
          filename = entity_graphics_path .. "hr-steel-pipe-to-ground-right.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
    },
  },
})
