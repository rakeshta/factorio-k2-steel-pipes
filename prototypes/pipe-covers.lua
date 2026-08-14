--
--  pipe-covers.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 23 Dec 2024.
--

local constants = require("prototypes.constants")
local pipe_covers_graphics_path = constants.graphics_path .. "pipe-covers/"

return {
  north = {
    layers = {
      {
        filename = pipe_covers_graphics_path .. "pipe-cover-north.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = pipe_covers_graphics_path .. "pipe-cover-north-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
  east = {
    layers = {
      {
        filename = pipe_covers_graphics_path .. "pipe-cover-east.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = pipe_covers_graphics_path .. "pipe-cover-east-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
  south = {
    layers = {
      {
        filename = pipe_covers_graphics_path .. "pipe-cover-south.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = pipe_covers_graphics_path .. "pipe-cover-south-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
  west = {
    layers = {
      {
        filename = pipe_covers_graphics_path .. "pipe-cover-west.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = pipe_covers_graphics_path .. "pipe-cover-west-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
}
