local lumber_item = mods["wood-logistics"] and settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"

data:extend({
  {
    type = "recipe",
    name = "algacultural-bay",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {type="item", name="steel-plate", amount=10},
      {type="item", name="electronic-circuit", amount=3},
      {type="item", name="spoilage", amount=20},
      {type="item", name="landfill", amount=1}
    },
    results = {{type="item", name="algacultural-bay", amount=1}}
  },
  {
    type = "recipe",
    name = "seaweed-blanching",
    localised_name = {"recipe-name.seaweed-blanching"},
    icons = {
      {icon=mods["wood-industry"] and "__wood-base-assets__/graphics/icons/woodchips.png" or "__base__/graphics/icons/wood.png"},
      {icon="__wood-universe-assets__/graphics/icons/seaweed.png", shift={-12,-12}}
    },
    category = "organic-or-chemistry",
    subgroup = "aquilo-processes",
    order = "g[algaculture]-a[wood]",
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
      {type="item", name=mods["wood-industry"] and "woodchips" or "wood", amount=5}
    },
    main_product = "",
  },
  {
    type = "recipe",
    name = "seabloom-cultivation",
    icon = "__wood-universe-assets__/graphics/icons/seabloom-cultivation.png",
    icons = {
      {icon="__wood-universe-assets__/graphics/icons/seabloom.png"},
      {icon="__space-age__/graphics/icons/fluid/ammonia.png", shift={-8,-8}, scale=0.3},
      {icon="__wood-universe-assets__/graphics/icons/seaweed.png", shift={8,-8}, scale=0.3},
    },
    category = "organic-or-chemistry",
    subgroup = "aquilo-processes",
    order = "g[algaculture]-b[cultivation]",
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    energy_required = 5,
    ingredients = {
      {type="item", name="seaweed", amount=5},
      {type="fluid", name="ammonia", amount=50}
    },
    results = {
      {type="item", name="seabloom", amount=1, probability=1/3},
      {type="item", name="seawilt", amount=4}
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
    order = "g[algaculture]-c[nutrients]",
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    allow_decomposition = false,
    energy_required = 1,
    ingredients = {{type="item", name="seabloom", amount=1}},
    results = {{type="item", name="nutrients", amount=20}}
  }
})
