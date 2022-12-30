--
--  pictures.lua
--  factorio-k2-steel-pipes
--
--  Created by Rakesh Ayyaswami on 31 Dec 2022.
--

local entity_graphics_path = k2_steel_pipes_path .. "graphics/steel-pipe-covers/"

steel_pipecoverspictures = {
  north = {
    layers = {
      {
        filename = entity_graphics_path .. "steel-pipe-cover-north.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        hr_version = {
          filename = entity_graphics_path .. "hr-steel-pipe-cover-north.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        draw_as_shadow = true,
        hr_version = {
          filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-north-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true,
        },
      },
    },
  },
  east = {
    layers = {
      {
        filename = entity_graphics_path .. "steel-pipe-cover-east.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        hr_version = {
          filename = entity_graphics_path .. "hr-steel-pipe-cover-east.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        draw_as_shadow = true,
        hr_version = {
          filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-east-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true,
        },
      },
    },
  },
  south = {
    layers = {
      {
        filename = entity_graphics_path .. "steel-pipe-cover-south.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        hr_version = {
          filename = entity_graphics_path .. "hr-steel-pipe-cover-south.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        draw_as_shadow = true,
        hr_version = {
          filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-south-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true,
        },
      },
    },
  },
  west = {
    layers = {
      {
        filename = entity_graphics_path .. "steel-pipe-cover-west.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        hr_version = {
          filename = entity_graphics_path .. "hr-steel-pipe-cover-west.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        draw_as_shadow = true,
        hr_version = {
          filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-west-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true,
        },
      },
    },
  },
}
