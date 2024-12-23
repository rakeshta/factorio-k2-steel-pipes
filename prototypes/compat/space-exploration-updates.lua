--
--  space-exploration.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 24 Dec 2024.
--

-- skip if space-exploration is not active
if not mods["space-exploration"] then
  return
end

-- allow in space
---@diagnostic disable: inject-field
data.raw["pipe"]["kr-steel-pipe"].se_allow_in_space = true
data.raw["pipe-to-ground"]["kr-steel-pipe-to-ground"].se_allow_in_space = true
data.raw["pump"]["kr-steel-pump"].se_allow_in_space = true
---@diagnostic enable: inject-field
