data:extend({
  {
    type = "technology",
    name = "seabloom-algaculture",
    icon = "__wood-universe-assets__/graphics/technology/seabloom-algaculture.png",
    icon_size = 256,
    effects = {
      {type="unlock-recipe", recipe="algacultural-bay"},
      {type="unlock-recipe", recipe="seaweed-blanching"},
      {type="unlock-recipe", recipe="seawilt-spoilage"}
    },
    prerequisites = {"planet-discovery-aquilo"},
    research_trigger = {
      type = "mine-entity",
      entity = "native-seabloom-cluster"
    }
  },
  {
    type = "technology",
    name = "advanced-seabloom-processing",
    icon = "__wood-universe-assets__/graphics/technology/seabloom-algaculture.png",
    icon_size = 256,
    effects = {
      {type="unlock-recipe", recipe="nutrients-from-seabloom"},
      {type="unlock-recipe", recipe="seaweed-snack"}
    },
    prerequisites = {"agricultural-science-pack", "cryogenic-science-pack", "seabloom-algaculture"},
    unit = {
      count = 500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"cryogenic-science-pack", 1}
      },
      time = 60
    }
  }
})
