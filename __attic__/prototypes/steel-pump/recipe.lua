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
      { type = "item", name = "iron-gear-wheel", amount = 4 },
      { type = "item", name = "engine-unit",     amount = 1 },
      { type = "item", name = "steel-plate",     amount = 1 },
      { type = "item", name = "kr-steel-pipe",   amount = 1 },
    },
    results = { { type = "item", name = "kr-steel-pump", amount = 1 } }
  },
})
