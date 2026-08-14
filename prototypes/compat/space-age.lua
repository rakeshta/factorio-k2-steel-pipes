--
--  space-age.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 24 Dec 2024.
--

-- skip if space-age is not active
if not mods["space-age"] then
  return
end

local constants = require("prototypes.constants")
local graphics_path = constants.graphics_path

-- recipes
data:extend({
  -- casting recipes
  {
    type = "recipe",
    name = "kr-casting-steel-pipe",
    categories = { "metallurgy" },
    subgroup = "energy-pipe-distribution",
    order = "b[casting]-h[casting-steel-pipe]",
    icon = graphics_path .. "icons/casting-pipe.png",
    enabled = false,
    ingredients = {
      { type = "fluid", name = "molten-iron", amount = 30, fluidbox_multiplier = 10 },
    },
    energy_required = 2,
    allow_decomposition = false,
    results = { { type = "item", name = "kr-steel-pipe", amount = 1 } },
    allow_productivity = false,
    auto_recycle = false,
  },

  {
    type = "recipe",
    name = "kr-casting-steel-pipe-to-ground",
    categories = { "metallurgy" },
    subgroup = "energy-pipe-distribution",
    order = "b[casting]-i[casting-steel-pipe-to-ground]",
    icon = graphics_path .. "icons/casting-pipe-to-ground.png",
    enabled = false,
    ingredients = {
      { type = "fluid", name = "molten-iron", amount = 450, fluidbox_multiplier = 10 },
      { type = "item", name = "kr-steel-pipe", amount = 30 },
    },
    energy_required = 3,
    allow_decomposition = false,
    results = { { type = "item", name = "kr-steel-pipe-to-ground", amount = 2 } },
    allow_productivity = false,
    auto_recycle = false,
  },
})

-- unlock casting recipes when foundry is researched
table.insert(data.raw.technology["foundry"].effects, { type = "unlock-recipe", recipe = "kr-casting-steel-pipe" })
table.insert(
  data.raw.technology["foundry"].effects,
  { type = "unlock-recipe", recipe = "kr-casting-steel-pipe-to-ground" }
)

-- do not allow underground pipe through space or lava
data.raw["pipe-to-ground"]["kr-steel-pipe-to-ground"].fluid_box.pipe_connections[2].underground_collision_mask =
  { layers = { lava_tile = true, empty_space = true } }

-- set heating energy for pipes & pump on Aquilo
data.raw["pipe"]["kr-steel-pipe"].heating_energy = "2kW"
data.raw["pipe-to-ground"]["kr-steel-pipe-to-ground"].heating_energy = "450kW"
data.raw["pump"]["kr-steel-pump"].heating_energy = "60kW"

-- configure frozen pipe graphics
local pipe_pictures = data.raw["pipe"]["kr-steel-pipe"].pictures
for _, property in pairs({
  "straight_vertical_single",
  "straight_vertical",
  "straight_vertical_window",
  "straight_horizontal",
  "straight_horizontal_window",
  "corner_up_right",
  "corner_up_left",
  "corner_down_right",
  "corner_down_left",
  "t_up",
  "t_down",
  "t_right",
  "t_left",
  "cross",
  "ending_up",
  "ending_down",
  "ending_right",
  "ending_left",
}) do
  local frozen_property = property .. "_frozen"
  pipe_pictures[frozen_property] = table.deepcopy(pipe_pictures[property])
  pipe_pictures[frozen_property].filename = util.string_replace(
    pipe_pictures[frozen_property].filename,
    graphics_path .. "pipe",
    "__space-age__/graphics/entity/frozen/pipe"
  )
end

local ptg = data.raw["pipe-to-ground"]["kr-steel-pipe-to-ground"]
ptg.frozen_patch = table.deepcopy(ptg.pictures)
for _, property in pairs({ "north", "south", "west", "east" }) do
  ptg.frozen_patch[property].filename = util.string_replace(
    ptg.frozen_patch[property].filename,
    graphics_path .. "pipe-to-ground",
    "__space-age__/graphics/entity/frozen/pipe-to-ground"
  )
end

-- configure frozen pipe covers
local function frozen_pipe_cover_pictures()
  return {
    north = {
      filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-north.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    east = {
      filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-east.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    south = {
      filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-south.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    west = {
      filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-west.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
  }
end

local steel_cover_north = graphics_path .. "pipe-covers/pipe-cover-north.png"
for _, prototype in pairs({
  data.raw["pipe"]["kr-steel-pipe"],
  data.raw["pipe-to-ground"]["kr-steel-pipe-to-ground"],
  data.raw["pump"]["kr-steel-pump"],
}) do
  ---@diagnostic disable-next-line: undefined-field
  local fluid_boxes = prototype.fluid_boxes or { prototype.fluid_box }
  for _, fluid_box in pairs(fluid_boxes) do
    if
      type(fluid_box) == "table"
      and fluid_box.pipe_covers
      and fluid_box.pipe_covers.north
      and fluid_box.pipe_covers.north.layers
      and fluid_box.pipe_covers.north.layers[1]
      and fluid_box.pipe_covers.north.layers[1].filename == steel_cover_north
    then
      fluid_box.pipe_covers_frozen = frozen_pipe_cover_pictures()
    end
  end
end

-- configure frozen pump graphics
data.raw["pump"]["kr-steel-pump"].frozen_patch = {
  north = {
    filename = "__space-age__/graphics/entity/frozen/pump/pump.png",
    priority = "extra-high",
    width = 128,
    height = 192,
    scale = 0.5,
  },
  east = {
    filename = "__space-age__/graphics/entity/frozen/pump/pump.png",
    priority = "extra-high",
    x = 128,
    width = 128,
    height = 128,
    scale = 0.5,
  },
  south = {
    filename = "__space-age__/graphics/entity/frozen/pump/pump.png",
    priority = "extra-high",
    x = 128 * 2,
    width = 128,
    height = 192,
    scale = 0.5,
  },
  west = {
    filename = "__space-age__/graphics/entity/frozen/pump/pump.png",
    priority = "extra-high",
    x = 128 * 3,
    width = 128,
    height = 128,
    scale = 0.5,
  },
}
