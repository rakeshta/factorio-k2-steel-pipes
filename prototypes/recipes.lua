--
--  entity.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 31 Dec 2022.
--

data:extend({
  -- steel pipe
  {
    type = "recipe",
    name = "kr-steel-pipe",
    ingredients = { { type = "item", name = "steel-plate", amount = 1 } },
    results = { { type = "item", name = "kr-steel-pipe", amount = 1 } },
    enabled = false
  },

  -- steel pipe to ground
  {
    type = "recipe",
    name = "kr-steel-pipe-to-ground",
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-steel-pipe", amount = 30 },
      { type = "item", name = "steel-plate",   amount = 15 },
    },
    results = { { type = "item", name = "kr-steel-pipe-to-ground", amount = 2 } }
  },

  -- steel pump
  {
    type = "recipe",
    name = "kr-steel-pump",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "iron-gear-wheel", amount = 4 },
      { type = "item", name = "engine-unit",     amount = 2 },
      { type = "item", name = "steel-plate",     amount = 4 },
      { type = "item", name = "kr-steel-pipe",   amount = 2 },
    },
    results = { { type = "item", name = "kr-steel-pump", amount = 1 } }
  },
});
