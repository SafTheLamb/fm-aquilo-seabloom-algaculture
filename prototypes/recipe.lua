local lumber_item = mods["wood-logistics"] and settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"
local chip_item = mods["wood-industry"] and settings.startup["wood-industry-resin"].value and "woodchips" or "wood"
local aquilo_start = false
if mods["any-planet-start"] then
  aquilo_start = settings.startup["aps-planet"].value == "aquilo"
end

data:extend({
  {
    type = "recipe",
    name = "algacultural-bay",
    enabled = false,
    energy_required = 10,
    ingredients = aquilo_start and {
      {type="item", name="steel-plate", amount=10},
      {type="item", name="electronic-circuit", amount=3},
      {type="item", name="spoilage", amount=20},
      {type="item", name="landfill", amount=1}
    } or {
      {type="item", name="tungsten-plate", amount=15},
      {type="item", name="superconductor", amount=20},
      {type="item", name="pentapod-egg", amount=10},
      {type="item", name="agricultural-tower", amount=1}
    },
    surface_conditions = {
      {
        property = "pressure",
        min = 300,
        max = 300
      }
    },
    results = {{type="item", name="algacultural-bay", amount=1}}
  },
  {
    type = "recipe",
    name = "seaweed-blanching",
    localised_name = {"recipe-name.seaweed-blanching"},
    icons = {
      {icon="__wood-universe-assets__/graphics/icons/seaweed.png", shift={-8,-8}, scale=0.4},
      {icon=(chip_item == "woodchips") and "__wood-base-assets__/graphics/icons/woodchips.png" or "__base__/graphics/icons/wood.png"}
    },
    category = "organic-or-chemistry",
    subgroup = "aquilo-processes",
    order = "g[algaculture]-a[woodchips]",
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    allow_decomposition = false,
    energy_required = 1,
    ingredients = {
      {type="item", name="seaweed", amount=5},
      {type="fluid", name="ammonia", amount=10},
      {type="fluid", name="steam", amount=10}
    },
    results = {
      {type="item", name="seabloom", amount=2, probability=0.06},
      {type="item", name=chip_item, amount=5}
    },
    main_product = "",
  },
  {
    type = "recipe",
    name = "seawilt-spoilage",
    icons = {
      {icon="__wood-universe-assets__/graphics/icons/seawilt.png", shift={-12,-12}, scale=0.4},
      {icon="__space-age__/graphics/icons/spoilage.png", draw_background=true},
    },
    category = mods["wood-industry"] and "kiln-smelting" or "smelting",
    subgroup = "aquilo-processes",
    order = "g[algaculture]-g[spoilage]",
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    allow_decomposition = false,
    energy_required = 1.6,
    ingredients = {
      {type="item", name="seawilt", amount=2}
    },
    results = {
      {type="item", name="spoilage", amount=1}
    }
  },
  {
    type = "recipe",
    name = "seabloom-cultivation",
    icons = {
      {icon="__wood-universe-assets__/graphics/icons/seabloom.png"},
      {icon="__space-age__/graphics/icons/fluid/fluoroketone-hot.png", shift={-8,-8}, scale=0.3}
    },
    category = "chemistry-or-cryogenics",
    subgroup = "aquilo-processes",
    order = "g[algaculture]-c[cultivation]",
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    allow_decomposition = false,
    energy_required = 2,
    ingredients = {
      {type="item", name="seaweed", amount=5, ignored_by_stats=4},
      {type="fluid", name="fluoroketone-hot", amount=6, ignored_by_stats=3}
    },
    results = {
      {type="item", name="seabloom", amount=3, probability=0.66},
      {type="fluid", name="fluoroketone-cold", amount=3, temperature=-150, ignored_by_stats=3, ignored_by_productivity=3},
      {type="item", name="seawilt", amount=4, ignored_by_stats=4, ignored_by_productivity=4},
    },
    main_product = "seabloom"
  },
  {
    type = "recipe",
    name = "nutrients-from-seabloom",
    localised_name = {"recipe-name.nutrients-from-seabloom"},
    icon = "__wood-universe-assets__/graphics/icons/nutrients-from-seabloom.png",
    category = "organic-or-assembling",
    subgroup = "aquilo-processes",
    order = "g[algaculture]-e[nutrients]",
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    allow_decomposition = false,
    energy_required = 1,
    ingredients = {{type="item", name="seabloom", amount=1}},
    results = {{type="item", name="nutrients", amount=20}}
  },
  {
    type = "recipe",
    name = "seaweed-snack",
    category = mods["wood-industry"] and "organic-or-kiln-smelting" or "organic",
    subgroup = "aquilo-processes",
    order = "g[algaculture]-f[snack]",
    enabled = false,
    auto_recycle = false,
    allow_productivity = false,
    allow_decomposition = false,
    energy_required = 2,
    ingredients = {
      {type="item", name="seaweed", amount=5},
      {type="item", name="nutrients", amount=1}
    },
    results = {{type="item", name="seaweed-snack", amount=5}}
  }
})

if mods["wood-industry"] and settings.startup["wood-industry-resin"].value then
  data:extend({
    {
      type = "recipe",
      name = "seabloom-juicing",
      icons = {
        {icon="__wood-universe-assets__/graphics/icons/seabloom.png", shift={-10,-10}, scale=0.4},
        {icon="__wood-base-assets__/graphics/icons/resin.png", draw_background=true},
      },
      category = mods["wood-industry"] and "kiln-smelting" or "smelting",
      subgroup = "aquilo-processes",
      order = "g[algaculture]-d[juicing]",
      enabled = false,
      auto_recycle = false,
      allow_productivity = true,
      allow_decomposition = false,
      energy_required = 1.6,
      ingredients = {
        {type="item", name="seabloom", amount=1}
      },
      results = {
        {type="item", name="resin", amount=4}
      },
      main_product = ""
    },
    {
      type = "recipe",
      name = "reconstituted-wood-aquilo",
      icons = {
        {icon="__wood-universe-assets__/graphics/icons/seaweed.png", shift={-8,-8}, scale=0.4},
        {icon="__wood-base-assets__/graphics/icons/resin.png", shift={8,-8}, scale=0.4},
        {icon="__base__/graphics/icons/wood.png", draw_background=true},
      },
      category = "organic-or-chemistry",
      subgroup = "aquilo-processes",
      order = "g[algaculture]-b[wood]",
      enabled = false,
      auto_recycle = false,
      allow_productivity = true,
      allow_decomposition = false,
      energy_required = 1.6,
      ingredients = {
        {type="item", name="seaweed", amount=2},
        {type="item", name="woodchips", amount=2},
        {type="item", name="resin", amount=1}
      },
      results = {{type="item", name="wood", amount=2}},
      main_product = ""
    }
  })
end
