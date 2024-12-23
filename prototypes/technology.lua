--
--  technology.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 24 Dec 2024.
--

local technology_graphics_path = k2_steel_pipes_path .. "graphics/technology/"

data:extend({
  {
    type = "technology",
    name = "kr-steel-fluid-handling",
    icon = technology_graphics_path .. "fluid-handling.png",
    icon_size = 256,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-steel-pipe",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-steel-pipe-to-ground",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-steel-pump",
      },
    },
    prerequisites = { "steel-processing", "fluid-handling" },
    unit = {
      count = 100,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
      },
      time = 30,
    },
  },
})
