--
--  steel-pipe-connectivity.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 14 Aug 2026.
--  Aligned with Krastorio 2 2.1.2 steel-pipe-connectivity (without flib).
--

local constants = require("prototypes.constants")

--- @param fluid_box data.FluidBox
local function add_category(fluid_box)
  if type(fluid_box) ~= "table" or not fluid_box.pipe_connections then
    return
  end

  for _, connection in pairs(fluid_box.pipe_connections) do
    local categories = connection.connection_category or { "default" }
    if type(categories) == "string" then
      categories = { categories }
    end
    if #categories == 1 and categories[1] == "default" and connection.connection_type ~= "underground" then
      categories[#categories + 1] = constants.connection_category
      connection.connection_category = categories
    end
  end
end

local skip_types = {
  pipe = true,
  ["pipe-to-ground"] = true,
}

local fluid_box_keys = {
  "fluid_box",
  "input_fluid_box",
  "output_fluid_box",
  "fuel_fluid_box",
  "oxidizer_fluid_box",
}

for type_name, prototypes in pairs(data.raw) do
  if not skip_types[type_name] then
    for _, entity in pairs(prototypes) do
      for _, key in pairs(fluid_box_keys) do
        if entity[key] then
          add_category(entity[key])
        end
      end

      ---@diagnostic disable-next-line: undefined-field
      local crafter_fluid_boxes = entity.fluid_boxes
      if crafter_fluid_boxes then
        for _, fluid_box in pairs(crafter_fluid_boxes) do
          add_category(fluid_box)
        end
      end

      ---@diagnostic disable-next-line: undefined-field
      local energy_source = entity.energy_source
      if energy_source and energy_source.type == "fluid" then
        add_category(energy_source.fluid_box)
      end
    end
  end
end
