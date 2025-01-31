local lumber_item = mods["wood-logistics"] and settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"

data:extend({
  {
    type = "recipe",
    name = "algacultural-bay",
    -- enabled = false,
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
    name = "seabloom-cultivation",
    icon = "__wood-universe-assets__/graphics/icons/seabloom-cultivation.png",
    icons = {
      {icon="__wood-universe-assets__/graphics/icons/seabloom.png"},
      {icon="__space-age__/graphics/icons/fluid/fluorine.png", shift={-8,-8}, scale=0.3},
      {icon="__wood-universe-assets__/graphics/icons/seaweed.png", shift={8,-8}, scale=0.3},
    },
    category = "organic-or-chemistry",
    subgroup = "aquilo-processes",
    -- enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    energy_required = 5,
    ingredients = {
      {type="item", name="seaweed", amount=5},
      {type="fluid", name="fluorine", amount=10}
    },
    results = {
      {type="item", name="seabloom", amount=1, probability=0.33},
      {type="item", name="seawilt", amount=4}
    },
    main_product = "seabloom"
  },
  {
    type = "recipe",
    name = "seabloom-molding",
    icons = {
      {icon=mods["wood-industry"] and "__wood-base-assets__/graphics/icons/woodchips.png" or "__base__/graphics/icons/wood.png"},
      {icon="__wood-universe-assets__/graphics/icons/seabloom.png", shift={-8,-8}, scale=0.3},
      {icon="__space-age__/graphics/icons/ice.png", shift={8,-8}, scale=0.3}
    },
    category = "organic-or-chemistry",
    subgroup = "aquilo-processes",
    -- enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    allow_decomposition = false,
    energy_required = 1,
    ingredients = {
      {type="item", name="seabloom", amount=1},
      {type="item", name="seaweed", amount=5},
      {type="item", name="ice", amount=1},
      {type="fluid", name="ammonia", amount=10}
    },
    results = {
      {type="item", name="seabloom", amount=1, probability=0.98, ignored_by_productivity=1},
      {type="item", name=mods["wood-industry"] and "woodchips" or "wood", amount=4}
    }
  },
  {
    type = "recipe",
    name = "nutrients-from-seabloom",
    icons = {
      {icon="__space-age__/graphics/icons/nutrients.png"},
      {icon="__wood-universe-assets__/graphics/icons/seabloom.png", shift={-8,-8}, scale=0.3}
    },
    category = "organic-or-assembling",
    subgroup = "aquilo-processes",
    -- enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    allow_decomposition = false,
    energy_required = 1,
    ingredients = {{type="item", name="seabloom", amount=1}},
    results = {{type="item", name="nutrients", amount=20}}
  }
})

if mods["wood-industry"] then
  data:extend({
    {
      type = "recipe",
      name = "burnt-seawilt",
      icons = {
        {icon="__wood-base-assets__/graphics/icons/charcoal.png"},
        {icon="__wood-universe-assets__/graphics/icons/seawilt.png", shift={-8,-8}, scale=0.3}
      },
      category = "organic-or-kiln-smelting",
      subgroup = "aquilo-processes",
      -- enabled = false,
      auto_recycle = false,
      allow_productivity = true,
      allow_decomposition = false,
      energy_required = 3.2,
      ingredients = {{type="item", name="seawilt", amount=5}},
      results = {{type="item", name="charcoal", amount=1}}
    },
  })

  if settings.startup["wood-industry-resin"].value then
    data:extend({
      {
        type = "recipe",
        name = "seabloom-juicing",
        icons = {
          {icon="__wood-base-assets__/graphics/icons/resin.png"},
          {icon="__wood-universe-assets__/graphics/icons/seabloom.png", shift={-8,-8}, scale=0.3}
        },
        category = "organic-or-chemistry",
        subgroup = "aquilo-processes",
        -- enabled = false,
        auto_recycle = false,
        allow_productivity = true,
        allow_decomposition = false,
        energy_required = 1,
        ingredients = {
          {type="item", name="seabloom", amount=2},
          {type="fluid", name="ammonia", amount=10}
        },
        results = {{type="item", name="resin", amount=3}}
      },
    })
  end
end
