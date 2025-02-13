local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

if mods["wood-industry"] and settings.startup["wood-industry-resin"].value then
  ftech.add_unlock("seabloom-algaculture", "seabloom-juicing")
  ftech.add_unlock("seabloom-algaculture", "reconstituted-wood-aquilo")
end

if settings.startup["seabloom-modify-vanilla"].value then
  frep.add_ingredient("ammoniacal-solution-separation", {type="item", name="seawilt", amount=1})
  frep.add_result("ammoniacal-solution-separation", {type="item", name="seaweed", amount=1, probability=0.49})
  frep.add_result("ammoniacal-solution-separation", {type="item", name="seabloom", amount=1, probability=0.01})
end

ftech.add_prereq("cryogenic-plant", "seabloom-algaculture")
ftech.add_unlock("cryogenic-plant", "seabloom-cultivation")

local aquilo = data.raw.planet["aquilo"]
aquilo.map_gen_settings.autoplace_controls["seabloom"] = {}
aquilo.map_gen_settings.autoplace_settings["entity"].settings["seabloom-cluster"] = {}

-- TODO: Use planetlib for this
for _,entity in pairs(data.raw["agricultural-tower"]) do
  for _,condition in pairs(entity.surface_conditions or {}) do
    if condition.property == "pressure" then
      condition.min = nil
    end
    if condition.property == "solar-power" then
      condition.min = 1
    end
  end
end
