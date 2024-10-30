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
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-plate", amount = 1 },
    },
    results = { { type = "item", name = "kr-steel-pipe", amount = 1 } }
  },
})
