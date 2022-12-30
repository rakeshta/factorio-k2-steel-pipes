--
--  recipe.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 31 Dec 2022.
--

data:extend({
  {
    type = "recipe",
    name = "kr-steel-pipe",
    normal = {
      enabled = false,
      ingredients = {
        { "steel-plate", 1 },
      },
      result = "kr-steel-pipe",
    },
    expensive = {
      enabled = false,
      ingredients = {
        { "steel-plate", 2 },
      },
      result = "kr-steel-pipe",
    },
  },
})
