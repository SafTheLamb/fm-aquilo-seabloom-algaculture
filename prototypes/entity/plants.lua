local sounds = require("__base__.prototypes.entity.sounds")

local plant_emissions = { pollution = -0.001 }
local plant_harvest_emissions = { spores = 15 }
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}

local leaf_sound_trigger = {
  {
    type = "play-sound",
    sound = leaf_sound,
    damage_type_filters = "fire"
  }
}

local function aquilo_algae_variations(name, variation_count, per_row, scale_multiplier, width, height, shift)
  variation_count = variation_count or 5
  per_row = per_row or 5
  scale_multiplier = scale_multiplier or 1
  local width = width or 640
  local height = height or 560
  local variations = {}
  local shift = shift or util.by_pixel(52, -40)
  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local variation = {
      trunk = {
        filename = "__wood-universe-assets__/graphics/entity/plant/"..name.."/"..name.."-trunk.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      leaves = {
        filename = "__wood-universe-assets__/graphics/entity/plant/"..name.."/"..name.."-harvest.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      normal = {
        filename = "__wood-universe-assets__/graphics/entity/plant/"..name.."/"..name.."-normal.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        filenames =
        {
          "__wood-universe-assets__/graphics/entity/plant/"..name.."/"..name.."-harvest-shadow.png",
          "__wood-universe-assets__/graphics/entity/plant/"..name.."/"..name.."-shadow.png"
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },

      leaf_generation =
      {
        type = "create-particle",
        particle_name = "leaf-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_vertical_speed = 0.01,
        initial_height_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.01
      },
      branch_generation =
      {
        type = "create-particle",
        particle_name = "branch-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_height_deviation = 2,
        initial_vertical_speed = 0.01,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.01,
        frame_speed = 0.4,
        repeat_count = 15
      }
    }
    table.insert(variations, variation)
  end
  return variations
end

local function minor_tints() -- Only for leaves where most if the colour is baked in.
  return {
    {r = 255, g = 255, b =  255},
    {r = 220, g = 255, b =  255},
    {r = 255, g = 220, b =  255},
    {r = 255, g = 255, b =  220},
    {r = 220, g = 220, b =  255},
    {r = 255, g = 220, b =  220},
    {r = 220, g = 255, b =  220},
  }
end

data:extend({
  {
    type = "plant",
    name = "seabloom-cluster",
    icon = "__wood-universe-assets__/graphics/icons/seabloom.png",
    flags = plant_flags,
    mining_trigger = {
      {
        type = "direct",
        action_delivery = {{type="instant", target_effects=leaf_sound_trigger}}
      }
    },
    -- mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    -- mined_sound = sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    growth_ticks = 5 * minute,
    harvest_emissions = plant_harvest_emissions,
    max_health = 10,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    subgroup = "trees",
    order = "a[tree]-e[aquilo]-a[seedable]-a[seabloom-cluster]",
    impact_category = "tree",
    -- factoriopedia_simulation = simulations.factoriopedia_yumako_tree,
    autoplace = {
      -- control = "gleba_plants",
      -- order = "a[tree]-b[forest]-a",
      probability_expression = "0",
      -- richness_expression = "random_penalty_at(3, 1)",
      tile_condition = {"ammoniacal-ocean", "ammoniacal-ocean-2"}
    },
    variations = aquilo_algae_variations("seabloom-cluster", 8, 4, 1.3),
    colors = minor_tints(),
    -- agricultural_tower_tint = {
    --   primary = {r = 0.552, g = 0.218, b = 0.218, a = 1.000}, -- #8c3737ff
    --   secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
    -- },
    -- ambient_sounds = {
    --   sound = {
    --     variations = sound_variations("__space-age__/sound/world/plants/yumako-tree", 6, 0.5),
    --     advanced_volume_control = {
    --       fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
    --     }
    --   },
    --   radius = 7.5,
    --   min_entity_count = 2,
    --   max_entity_count = 10,
    --   entity_to_sound_ratio = 0.2,
    --   average_pause_seconds = 8
    -- },
    -- map_color = {255, 255, 255},
  }
})