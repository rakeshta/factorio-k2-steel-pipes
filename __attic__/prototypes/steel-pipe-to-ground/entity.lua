--
--  entity.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 31 Dec 2022.
--

local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local entity_graphics_path = k2_steel_pipes_path .. "graphics/steel-pipe-to-ground/"

data:extend({
  {
    type = "pipe-to-ground",
    name = "kr-steel-pipe-to-ground",
    icon = entity_graphics_path .. "steel-pipe-to-ground-icon.png",
    icon_size = 64,
    -- icon_mipmaps = 4,
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.1, result = "kr-steel-pipe-to-ground" },
    max_health = 300,
    corpse = "pipe-to-ground-remnants",
    dying_explosion = "pipe-to-ground-explosion",
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
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box = {
      base_area = 1,
      volume = 200,
      height = 1.25,
      pipe_covers = steel_pipecoverspictures,
      pipe_connections = {
        { direction = defines.direction.north, position = { 0, -0.2 } },
        {
          direction = defines.direction.south,
          position = { 0, 0.2 },
          connection_type = "underground",
          max_underground_distance = 30,
        },
      },
    },
    impact_category = "metal",
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,
    pictures = {
      north = {
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
      south = {
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
      west = {
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
      east = {
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
