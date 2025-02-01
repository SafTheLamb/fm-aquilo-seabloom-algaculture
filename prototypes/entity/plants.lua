local sounds = require("__base__.prototypes.entity.sounds")

local plant_emissions = { pollution = -0.001 }
local plant_harvest_emissions = { spores = 15 }
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}

local leaf_sound = sounds.tree_leaves
local leaf_sound_trigger = {
  {
    type = "play-sound",
    sound = leaf_sound,
    damage_type_filters = "fire"
  }
}

local function aquilo_algae_variations(name, variation_count, per_row, scale_multiplier, width, height, shift)
  variation_count = variation_count or 8
  per_row = per_row or 4
  scale_multiplier = scale_multiplier or 1
  local width = width or 120
  local height = height or 160
  local variations = {}
  local shift = shift or util.by_pixel(0, 16)
  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local variation = {
      trunk = {
        filename = "__wood-universe-assets__/graphics/entity/plant/"..name.."/"..name.."-trunk.png",
        blend_mode = "multiplicative",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        tint = {1, 1, 1, 0.5},
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

data:extend({
  {
    type = "plant",
    name = "seabloom-cluster",
    icon = "__wood-universe-assets__/graphics/icons/seabloom.png",
    flags = plant_flags,
    minable = {
      mining_particle = "leaf-particle",
      mining_time = 0.5,
      results = {{type="item", name="seaweed", amount=10}},
      mining_trigger = {
        {
          type = "direct",
          action_delivery ={{type="instant", target_effects=leaf_sound_trigger}}
        }
      }
    },
    -- mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    -- mined_sound = sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    growth_ticks = 1 * minute,
    harvest_emissions = plant_harvest_emissions,
    max_health = 10,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {layers={ground_tile=true, train=true, is_object=true, is_lower_object=true}}, -- not player
    subgroup = "trees",
    order = "a[tree]-e[aquilo]-a[seedable]-a[seabloom-cluster]",
    impact_category = "tree",
    -- factoriopedia_simulation = simulations.factoriopedia_yumako_tree,
    autoplace = {
      control = "seabloom",
      -- order = "a[tree]-b[forest]-a",
      probability_expression = "min(aquilo_seabloom_noise, aquilo_seabloom_cutoff)",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = {"ammoniacal-ocean", "ammoniacal-ocean-2"}
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{0.8, 0.2}},
            check_buildability = true,
            probability = 0.1
          },
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{-0.8, -0.1}},
            check_buildability = true,
            probability = 0.1
          },
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{0.1, 0.8}},
            check_buildability = true,
            probability = 0.1
          },
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{0, -0.6}},
            check_buildability = true,
            probability = 0.1
          },
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{0.7, 0.7}},
            check_buildability = true,
            probability = 0.1
          },
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{-0.6, -0.7}},
            check_buildability = true,
            probability = 0.1
          },
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{-0.4, 0.7}},
            check_buildability = true,
            probability = 0.1
          },
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{0.6, -0.4}},
            check_buildability = true,
            probability = 0.1
          },
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{1.2,0.9}},
            check_buildability = true,
            probability = 0.1
          },
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{1.3,-0.2}},
            check_buildability = true,
            probability = 0.1
          },
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{-1.3,0.5}},
            check_buildability = true,
            probability = 0.1
          },
          {
            type = "create-entity",
            entity_name = "seabloom-straggler",
            offsets = {{-1.2,-0.3}},
            check_buildability = true,
            probability = 0.1
          },
        }
      }
    },
    variations = aquilo_algae_variations("seabloom-cluster", 8, 4, 1.3),
    colors = {
      {r = 255, g = 255, b =  255},
      {r = 220, g = 255, b =  255},
      {r = 255, g = 240, b =  255},
      {r = 255, g = 255, b =  220},
      {r = 220, g = 240, b =  255},
      {r = 255, g = 240, b =  220},
      {r = 220, g = 255, b =  220},
    },
    agricultural_tower_tint = {
      primary = {r = 0.218, g = 0.552, b = 0.218, a = 1.000}, -- #378c37ff
      secondary = {r = 0.308, g = 0.613, b = 0.561, a = 1.000}, -- #4e4f8fff
    },
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
    map_color = {153, 255, 102},
  },
  {
    type = "plant",
    name = "seabloom-straggler",
    icon = "__wood-universe-assets__/graphics/icons/seawilt.png",
    flags = plant_flags,
    minable = {
      mining_particle = "leaf-particle",
      mining_time = 0.5,
      results = {{type="item", name="seaweed", amount=1}},
      mining_trigger = {
        {
          type = "direct",
          action_delivery ={{type="instant", target_effects=leaf_sound_trigger}}
        }
      }
    },
    -- mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    -- mined_sound = sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    growth_ticks = 5 * minute,
    harvest_emissions = plant_harvest_emissions,
    max_health = 10,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {layers={ground_tile=true, train=true, is_object=true, is_lower_object=true}}, -- not player
    subgroup = "trees",
    order = "a[tree]-e[aquilo]-a[seedable]-b[seabloom-straggler]",
    impact_category = "tree",
    -- factoriopedia_simulation = simulations.factoriopedia_yumako_tree,
    autoplace = {
      control = "seabloom",
      -- order = "a[tree]-b[forest]-a",
      probability_expression = "min(aquilo_seabloom_noise_b, aquilo_seabloom_cutoff)",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = {"ammoniacal-ocean", "ammoniacal-ocean-2"}
    },
    variations = aquilo_algae_variations("seabloom-straggler", 8, 4),
    colors = {
      {r = 255, g = 235, b =  255},
      {r = 220, g = 235, b =  255},
      {r = 255, g = 220, b =  255},
      {r = 255, g = 235, b =  220},
      {r = 220, g = 220, b =  255},
      {r = 255, g = 220, b =  220},
      {r = 220, g = 235, b =  220},
    },
    agricultural_tower_tint = {
      primary = {r = 0.218, g = 0.552, b = 0.218, a = 1.000}, -- #378c37ff
      secondary = {r = 0.308, g = 0.613, b = 0.561, a = 1.000}, -- #4e4f8fff
    },
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
    map_color = {51, 128, 32},
  }
})

local worldgen_seabloom = util.table.deepcopy(data.raw.plant["seabloom-cluster"])
worldgen_seabloom.localised_name = {"", "entity-name.seabloom-cluster"}
worldgen_seabloom.name = "native-seabloom-cluster"
worldgen_seabloom.created_effect = nil
worldgen_seabloom.hidden_in_factoriopedia = true
data.raw.plant["seabloom-cluster"].autoplace.probability_expression = "0"
data:extend({
  worldgen_seabloom
})
