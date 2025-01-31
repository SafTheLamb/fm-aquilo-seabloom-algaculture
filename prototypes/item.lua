local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
  {
    type = "item",
    name = "algacultural-bay",
    icon = "__space-age__/graphics/icons/agricultural-tower.png",
    subgroup = "agriculture",
    order = "c[algacultural-bay]",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "algacultural-bay",
    stack_size = 20
  },
  {
    type = "item",
    name = "seaweed",
    localised_name = {"item-name.seaweed"},
    icon = "__wood-universe-assets__/graphics/icons/seaweed.png",
    pictures = {
      {size=64, filename="__wood-universe-assets__/graphics/icons/seaweed.png", scale=0.5},
      {size=64, filename="__wood-universe-assets__/graphics/icons/seaweed-1.png", scale=0.5},
      {size=64, filename="__wood-universe-assets__/graphics/icons/seaweed-2.png", scale=0.5},
      {size=64, filename="__wood-universe-assets__/graphics/icons/seaweed-3.png", scale=0.5}
    },
    subgroup = "aquilo-processes",
    order = "d[agriculture]-a[seaweed]",
    plant_result = "seabloom-cluster",
    place_result = "seabloom-cluster",
    fuel_category = "chemical",
    fuel_value = "1MJ",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 100,
    spoil_ticks = 2*minute,
    spoil_result = "seawilt"
  },
  {
    type = "item",
    name = "seabloom",
    localised_name = {"item-name.seabloom"},
    icon = "__wood-universe-assets__/graphics/icons/seabloom.png",
    pictures = {
      {size=64, filename="__wood-universe-assets__/graphics/icons/seabloom.png", scale=0.5},
      {size=64, filename="__wood-universe-assets__/graphics/icons/seabloom-1.png", scale=0.5},
      {size=64, filename="__wood-universe-assets__/graphics/icons/seabloom-2.png", scale=0.5},
      {size=64, filename="__wood-universe-assets__/graphics/icons/seabloom-3.png", scale=0.5}
    },
    subgroup = "aquilo-processes",
    order = "d[agriculture]-b[seabloom]",
    plant_result = "seabloom-cluster",
    place_result = "seabloom-cluster",
    fuel_category = "chemical",
    fuel_value = "100kJ",
    fuel_acceleration_multiplier = 0.5,
    fuel_top_speed_multiplier = 0.5,
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 100,
    spoil_ticks = 30*second,
    spoil_result = "seaweed"
  },
  {
    type = "item",
    name = "seawilt",
    localised_name = {"item-name.seawilt"},
    icon = "__wood-universe-assets__/graphics/icons/seawilt.png",
    pictures = {
      {size=64, filename="__wood-universe-assets__/graphics/icons/seawilt.png", scale=0.5},
      {size=64, filename="__wood-universe-assets__/graphics/icons/seawilt-1.png", scale=0.5},
      {size=64, filename="__wood-universe-assets__/graphics/icons/seawilt-2.png", scale=0.5},
      {size=64, filename="__wood-universe-assets__/graphics/icons/seawilt-3.png", scale=0.5}
    },
    subgroup = "aquilo-processes",
    order = "d[agriculture]-c[seawilt]",
    plant_result = "seabloom-straggler",
    place_result = "seabloom-straggler",
    fuel_category = "chemical",
    fuel_value = "100kJ",
    fuel_acceleration_multiplier = 0.5,
    fuel_top_speed_multiplier = 0.5,
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 200,
    weight = 0.5*kg,
    random_tint_color = item_tints.organic_green,
    spoil_level = 1
  }
})
