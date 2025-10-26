if mods["Voidcraft"] then
	local vcc = require("__Voidcraft__.prototypes.costs")

	local vc_recipes = {}
	table.insert(vc_recipes, VOIDCRAFT.voidcraft_recipe({prefix="__aquilo-seabloom-algaculture__", subgroup="voidcraft-aquilo"}, {"seaweed", "wood", "fluoroketone-cold-barrel"}, "vpd-xbw", vcc.ammonia, "s6x-void-aquilo", {0.22, 0.7, 0.6}))

	if next(vc_recipes) ~= nil  then
		data:extend(vc_recipes)
		for _, recipe in pairs(vc_recipes) do
			data:extend({
				VOIDCRAFT.coherize(recipe),
				VOIDCRAFT.fluxize(recipe)
			})
		end
	end
end
