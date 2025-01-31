local frep = require("__fdsl__.lib.recipe")

if settings.startup["seabloom-modify-vanilla"].value then
  frep.add_ingredient("ammoniacal-solution-separation", {type="item", name="seaweed", amount=1})
  frep.add_result("ammoniacal-solution-separation", {type="item", name="seabloom", amount=1, probability=0.01})

  frep.add_ingredient("lithium", {type="item", name="seabloom", amount=1})
end

local aquilo = data.raw.planet["aquilo"]
aquilo.map_gen_settings.autoplace_controls["seabloom"] = {}
aquilo.map_gen_settings.autoplace_settings["entity"].settings["seabloom-cluster"] = {}
