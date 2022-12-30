--
--  technology.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 31 Dec 2022.
--

local technology_graphics_path = k2_steel_pipes_path .. "graphics/technology/"


data:extend({
  {
    type = "technology",
    name = "kr-steel-fluid-handling",
    mod = "Krastorio2",
    icon = technology_graphics_path .. "steel-fluid-handling.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-steel-pipe",
      },
      -- {
      --   type = "unlock-recipe",
      --   recipe = "kr-steel-pipe-to-ground",
      -- },
      -- {
      --   type = "unlock-recipe",
      --   recipe = "kr-steel-pump",
      -- },
    },
    prerequisites = { "steel-processing", "fluid-handling" },
    unit = {
      count = 100,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 30,
    },
  },
})
