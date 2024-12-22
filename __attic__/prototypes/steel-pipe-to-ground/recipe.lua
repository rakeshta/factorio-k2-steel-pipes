--
--  recipe.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 31 Dec 2022.
--

data:extend({
  {
    type = "recipe",
    name = "kr-steel-pipe-to-ground",
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-steel-pipe", amount = 15 },
      { type = "item", name = "steel-plate",   amount = 5 },
    },
    results = { { type = "item", name = "kr-steel-pipe-to-ground", amount = 2 } }
  },
})
