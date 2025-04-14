local ftech = require("__fdsl__.lib.technology")

if mods["wood-industry"] and settings.startup["wood-industry-resin"].value then
  ftech.add_unlock("seabloom-algaculture", "seabloom-juicing")
  ftech.add_unlock("seabloom-algaculture", "reconstituted-wood-aquilo")
end

ftech.add_prereq("cryogenic-plant", "seabloom-algaculture")
ftech.add_unlock("cryogenic-plant", "seabloom-cultivation")
