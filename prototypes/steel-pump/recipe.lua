--
--  recipe.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 31 Dec 2022.
--

data:extend({
  {
    type = "recipe",
    name = "kr-steel-pump",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { "iron-gear-wheel", 4 },
      { "engine-unit", 1 },
      { "steel-plate", 1 },
      { "kr-steel-pipe", 1 },
    },
    result = "kr-steel-pump",
  },
})
