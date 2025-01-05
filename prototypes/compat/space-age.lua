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

local graphics_path = k2_steel_pipes_path .. "graphics/"

-- recipes
data:extend({
  -- casting recipes
  {
    type = "recipe",
    name = "kr-casting-steel-pipe",
    category = "metallurgy",
    subgroup = "energy-pipe-distribution",
    order = "b[casting]-h[casting-steel-pipe]",
    icon = graphics_path .. "icons/casting-pipe.png",
    enabled = false,
    ingredients =
    {
      { type = "fluid", name = "molten-iron", amount = 30, fluidbox_multiplier = 10 },
    },
    energy_required = 2,
    allow_decomposition = false,
    results = { { type = "item", name = "kr-steel-pipe", amount = 1 } },
    allow_productivity = false
  },

  {
    type = "recipe",
    name = "kr-casting-steel-pipe-to-ground",
    category = "metallurgy",
    subgroup = "energy-pipe-distribution",
    order = "b[casting]-i[casting-steel-pipe-to-ground]",
    icon = graphics_path .. "icons/casting-pipe-to-ground.png",
    enabled = false,
    ingredients =
    {
      { type = "fluid", name = "molten-iron",   amount = 450, fluidbox_multiplier = 10 },
      { type = "item",  name = "kr-steel-pipe", amount = 30 }
    },
    energy_required = 3,
    allow_decomposition = false,
    results = { { type = "item", name = "kr-steel-pipe-to-ground", amount = 2 } },
    allow_productivity = false
  },
})

-- unlock casting recipes when foundry is researched
table.insert(data.raw.technology["foundry"].effects, { type = "unlock-recipe", recipe = "kr-casting-steel-pipe" })
table.insert(data.raw.technology["foundry"].effects,
  { type = "unlock-recipe", recipe = "kr-casting-steel-pipe-to-ground" })
