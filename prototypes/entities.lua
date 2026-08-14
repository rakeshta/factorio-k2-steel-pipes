--
--  entities.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 23 Dec 2024.
--  Aligned with Factorio 2.1 and Krastorio 2 2.1 steel pipe connectivity.
--

local constants = require("prototypes.constants")
local steel_pipe_covers = require("prototypes.pipe-covers")
local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

local graphics_path = constants.graphics_path
local vanilla_pipe = data.raw.pipe.pipe
local vanilla_pipe_to_ground = data.raw["pipe-to-ground"]["pipe-to-ground"]
local vanilla_pump = data.raw.pump.pump

local function steel_pipe_connection(direction, extra)
  local connection = {
    direction = direction,
    position = { 0, 0 },
    connection_category = constants.connection_category,
    hide_connection_info = true,
  }
  if extra then
    for key, value in pairs(extra) do
      connection[key] = value
    end
  end
  return connection
end

local function steel_pipe_pictures()
  local pictures = {
    straight_vertical_single = {
      filename = graphics_path .. "pipe/pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 160,
      height = 160,
      scale = 0.5,
    },
    straight_vertical = {
      filename = graphics_path .. "pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    straight_vertical_window = {
      filename = graphics_path .. "pipe/pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    straight_horizontal_window = {
      filename = graphics_path .. "pipe/pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    straight_horizontal = {
      filename = graphics_path .. "pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    corner_up_right = {
      filename = graphics_path .. "pipe/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    corner_up_left = {
      filename = graphics_path .. "pipe/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    corner_down_right = {
      filename = graphics_path .. "pipe/pipe-corner-down-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    corner_down_left = {
      filename = graphics_path .. "pipe/pipe-corner-down-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    t_up = {
      filename = graphics_path .. "pipe/pipe-t-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    t_down = {
      filename = graphics_path .. "pipe/pipe-t-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    t_right = {
      filename = graphics_path .. "pipe/pipe-t-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    t_left = {
      filename = graphics_path .. "pipe/pipe-t-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    cross = {
      filename = graphics_path .. "pipe/pipe-cross.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    ending_up = {
      filename = graphics_path .. "pipe/pipe-ending-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    ending_down = {
      filename = graphics_path .. "pipe/pipe-ending-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    ending_right = {
      filename = graphics_path .. "pipe/pipe-ending-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    ending_left = {
      filename = graphics_path .. "pipe/pipe-ending-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    horizontal_window_background = {
      filename = graphics_path .. "pipe/pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    vertical_window_background = {
      filename = graphics_path .. "pipe/pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    fluid_background = {
      filename = "__base__/graphics/entity/pipe/fluid-background.png",
      priority = "extra-high",
      width = 64,
      height = 40,
      scale = 0.5,
    },
    low_temperature_flow = {
      filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18,
    },
    middle_temperature_flow = {
      filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18,
    },
    high_temperature_flow = {
      filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18,
    },
    gas_flow = {
      filename = "__base__/graphics/entity/pipe/steam.png",
      priority = "extra-high",
      line_length = 10,
      width = 48,
      height = 30,
      frame_count = 60,
    },
  }

  for key, value in pairs(vanilla_pipe.pictures) do
    if string.find(key, "visualization", 1, true) then
      pictures[key] = value
    end
  end

  return pictures
end

data:extend({
  {
    type = "pipe",
    name = "kr-steel-pipe",
    icon = graphics_path .. "icons/pipe.png",
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.1, result = "kr-steel-pipe" },
    max_health = 200,
    corpse = "kr-steel-pipe-remnants",
    dying_explosion = "pipe-explosion",
    icon_draw_specification = { scale = 0.5 },
    resistances = {
      {
        type = "fire",
        percent = 90,
      },
      {
        type = "impact",
        percent = 50,
      },
    },
    fast_replaceable_group = "pipe",
    collision_box = { { -0.29, -0.29 }, { 0.29, 0.29 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box = {
      volume = 100,
      pipe_covers = steel_pipe_covers,
      pipe_connections = {
        steel_pipe_connection(defines.direction.north),
        steel_pipe_connection(defines.direction.east),
        steel_pipe_connection(defines.direction.south),
        steel_pipe_connection(defines.direction.west),
      },
    },
    circuit_connector = circuit_connector_definitions["pipe"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_fluid_temperature_signal = { type = "virtual", name = "signal-T" },
    impact_category = "metal",
    pictures = steel_pipe_pictures(),
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,

    horizontal_window_bounding_box = { { -0.25, -0.28125 }, { 0.25, 0.15625 } },
    vertical_window_bounding_box = { { -0.28125, -0.5 }, { 0.03125, 0.125 } },
  },

  {
    type = "pipe-to-ground",
    name = "kr-steel-pipe-to-ground",
    icon = graphics_path .. "icons/pipe-to-ground.png",
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.1, result = "kr-steel-pipe-to-ground" },
    max_health = 300,
    corpse = "kr-steel-pipe-to-ground-remnants",
    dying_explosion = "pipe-to-ground-explosion",
    icon_draw_specification = { scale = 0.5 },
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
      volume = 200,
      pipe_covers = steel_pipe_covers,
      pipe_connections = {
        steel_pipe_connection(defines.direction.north, { flow_direction = "input-output" }),
        steel_pipe_connection(defines.direction.south, {
          flow_direction = "input-output",
          connection_type = "underground",
          max_underground_distance = 30,
        }),
      },
    },
    impact_category = "metal",
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,
    circuit_connector = circuit_connector_definitions["pipe-to-ground"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_fluid_temperature_signal = { type = "virtual", name = "signal-T" },
    pictures = {
      north = {
        filename = graphics_path .. "pipe-to-ground/pipe-to-ground-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      south = {
        filename = graphics_path .. "pipe-to-ground/pipe-to-ground-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      west = {
        filename = graphics_path .. "pipe-to-ground/pipe-to-ground-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      east = {
        filename = graphics_path .. "pipe-to-ground/pipe-to-ground-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
    },
    visualization = vanilla_pipe_to_ground.visualization,
    disabled_visualization = vanilla_pipe_to_ground.disabled_visualization,
  },

  {
    type = "pump",
    name = "kr-steel-pump",
    icon = graphics_path .. "icons/pump.png",
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.2, result = "kr-steel-pump" },
    max_health = 220,
    fast_replaceable_group = "pipe",
    corpse = "kr-steel-pump-remnants",
    dying_explosion = "pump-explosion",
    collision_box = { { -0.29, -0.9 }, { 0.29, 0.9 } },
    selection_box = { { -0.5, -1 }, { 0.5, 1 } },
    icon_draw_specification = { scale = 0.5 },
    working_sound = vanilla_pump.working_sound,
    damaged_trigger_effect = hit_effects.entity(),
    resistances = {
      {
        type = "fire",
        percent = 90,
      },
      {
        type = "impact",
        percent = 50,
      },
    },
    fluid_box = {
      volume = 800,
      pipe_covers = steel_pipe_covers,
      pipe_connections = {
        { direction = defines.direction.north, position = { 0, -0.5 }, flow_direction = "output" },
        { direction = defines.direction.south, position = { 0, 0.5 }, flow_direction = "input" },
      },
    },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "2kW",
    },
    energy_usage = "50kW",
    pumping_speed = 40,
    impact_category = "metal",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    base_lifting_sound = vanilla_pump.base_lifting_sound,
    arm_orienting_sound = vanilla_pump.arm_orienting_sound,
    clamp_sound = vanilla_pump.clamp_sound,

    animations = {
      north = {
        filename = graphics_path .. "pump/pump-north.png",
        width = 103,
        height = 164,
        scale = 0.5,
        line_length = 8,
        frame_count = 32,
        animation_speed = 0.5,
        shift = util.by_pixel(8, 3.5),
      },
      east = {
        filename = graphics_path .. "pump/pump-east.png",
        width = 130,
        height = 109,
        scale = 0.5,
        line_length = 8,
        frame_count = 32,
        animation_speed = 0.5,
        shift = util.by_pixel(-0.5, 1.75),
      },
      south = {
        filename = graphics_path .. "pump/pump-south.png",
        width = 114,
        height = 160,
        scale = 0.5,
        line_length = 8,
        frame_count = 32,
        animation_speed = 0.5,
        shift = util.by_pixel(12.5, -8),
      },
      west = {
        filename = graphics_path .. "pump/pump-west.png",
        width = 131,
        height = 111,
        scale = 0.5,
        line_length = 8,
        frame_count = 32,
        animation_speed = 0.5,
        shift = util.by_pixel(-0.25, 1.25),
      },
    },

    wagon_connection_graphics = require("__base__.prototypes.entity.pump-wagon-connector-graphics"),
    fluid_wagon_tank_valve_max_distance = 2.22,

    fluid_animation = {
      north = {
        filename = graphics_path .. "pump/pump-north-liquid.png",
        apply_runtime_tint = true,
        width = 38,
        height = 22,
        scale = 0.5,
        line_length = 8,
        frame_count = 32,
        shift = util.by_pixel(-0.250, -16.750),
      },
      east = {
        filename = graphics_path .. "pump/pump-east-liquid.png",
        width = 35,
        height = 46,
        scale = 0.5,
        line_length = 8,
        frame_count = 32,
        shift = util.by_pixel(6.25, -8.5),
      },
      south = {
        filename = graphics_path .. "pump/pump-south-liquid.png",
        width = 38,
        height = 45,
        scale = 0.5,
        line_length = 8,
        frame_count = 32,
        shift = util.by_pixel(0.5, -9.25),
      },
      west = {
        filename = graphics_path .. "pump/pump-west-liquid.png",
        width = 35,
        height = 47,
        scale = 0.5,
        line_length = 8,
        frame_count = 32,
        shift = util.by_pixel(-6.5, -9.5),
      },
    },

    glass_pictures = {
      north = {
        filename = graphics_path .. "pump/pump-north-glass.png",
        width = 64,
        height = 128,
        scale = 0.5,
      },
      east = {
        filename = graphics_path .. "pump/pump-east-glass.png",
        width = 128,
        height = 192,
        scale = 0.5,
      },
      south = {
        filename = graphics_path .. "pump/pump-south-glass.png",
        width = 64,
        height = 128,
        scale = 0.5,
      },
      west = {
        filename = graphics_path .. "pump/pump-west-glass.png",
        width = 192,
        height = 192,
        scale = 0.5,
        shift = util.by_pixel(-16, 0),
      },
    },

    circuit_connector = circuit_connector_definitions["pump"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
  },
})
