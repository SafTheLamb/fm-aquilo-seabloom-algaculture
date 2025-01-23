local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

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
    icon = "__wood-universe-assets__/graphics/icons/seaweed.png",
    subgroup = "aquilo-processes",
    order = "d[agriculture]-a[seaweed]",
    plant_result = "seabloom-cluster",
    place_result = "seabloom-cluster",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "100kJ",
    stack_size = 10,
    spoil_ticks = 15*minute,
    spoil_result = "seawilt"
  },
  {
    type = "item",
    name = "seabloom",
    icon = "__wood-universe-assets__/graphics/icons/seabloom.png",
    subgroup = "aquilo-processes",
    order = "d[agriculture]-b[seabloom]",
    plant_result = "seabloom-cluster",
    place_result = "seabloom-cluster",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "100kJ",
    stack_size = 10,
    spoil_ticks = 30*second,
    spoil_result = "seawilt"
  },
  {
    type = "item",
    name = "seawilt",
    icon = "__wood-universe-assets__/graphics/icons/seawilt.png",
    subgroup = "aquilo-processes",
    order = "d[agriculture]-c[seawilt]",
    plant_result = "seabloom-straggler",
    place_result = "seabloom-straggler",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "100kJ",
    stack_size = 50
  }
})
