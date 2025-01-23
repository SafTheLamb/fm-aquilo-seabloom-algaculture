local lumber_item = mods["wood-logistics"] and settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"

data:extend({
  {
    type = "recipe",
    name = "algacultural-bay",
    energy_required = 10,
    -- enabled = false,
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
    name = "seabloom-molding",
    
  },
  -- {
  --   type = "recipe",
  --   name = "seabloom-molding",
  --   icons = {
  --     {icon="__base__/graphics/icons/wood.png"},
  --     {icon="__wood-universe-assets__/graphics/icons/seabloom.png", shift={-8,-8}, scale=0.3},
  --     {icon="__base__/graphics/icons/plastic.png", shift={8,-8}, scale=0.3}
  --   },
  --   category = "organic-or-chemistry",
  --   subgroup = "aquilo-processes",
  --   allow_productivity = true,
  --   auto_recycle = false,
  --   -- enabled = false,
  --   ingredients = {
  --     {type="item", name="seabloom", amount=1},
  --     {type="item", name="seaweed", amount=5},
  --     {type="item", name="plastic-bar", amount=1},
  --     {type="fluid", name="ammonia", amount=10}
  --   },
  --   results = {
  --     {type="item", name="seabloom", amount=1, ignored_by_productivity=1},
  --     {type="item", name="seawilt", amount=4, ignored_by_productivity=4},
  --     {type="item", name="wood", amount=4}
  --   }
  -- }
})
