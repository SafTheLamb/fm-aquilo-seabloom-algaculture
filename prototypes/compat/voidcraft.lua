if mods["Voidcraft"] then
  local vcc = require("__Voidcraft__.prototypes.costs")

  data:extend({
    VOIDCRAFT.voidcraft_recipe({prefix="__aquilo-seabloom-algaculture__", subgroup="voidcraft-aquilo"}, {"seaweed", "wood", "fluoroketone-cold-barrel"}, "vpd-xbw", vcc.ammonia, "s6x-void-aquilo", {0.22, 0.7, 0.6}),
  })
end
