local frep = require("__fdsl__.lib.recipe")

if settings.startup["seabloom-modify-vanilla"].value then
  frep.add_ingredient("ammoniacal-solution-separation", {type="item", name="seawilt", amount=1})
  frep.add_result("ammoniacal-solution-separation", {type="item", name="seaweed", amount=1, probability=0.49})
  frep.add_result("ammoniacal-solution-separation", {type="item", name="seabloom", amount=1, probability=0.01})
  frep.add_ingredient("ammonia-rocket-fuel", {type="item", name="seabloom", amount=1})
  frep.add_ingredient("cryogenic-science-pack", {type="item", name="seabloom", amount=1})
end

local aquilo = data.raw.planet["aquilo"]
if aquilo and aquilo.map_gen_settings and aquilo.map_gen_settings.autoplace_controls then
  aquilo.map_gen_settings.autoplace_controls["seabloom"] = {}
  aquilo.map_gen_settings.autoplace_settings["entity"].settings["seabloom-cluster"] = {}
end
