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
if aquilo and aquilo.map_gen_settings and aquilo.map_gen_settings.autoplace_controls then
  aquilo.map_gen_settings.autoplace_controls["seabloom"] = {}
  aquilo.map_gen_settings.autoplace_settings["entity"].settings["seabloom-cluster"] = {}
end
