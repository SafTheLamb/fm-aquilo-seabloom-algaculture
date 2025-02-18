-- TODO: Use planetlib for this
for _,entity in pairs(data.raw["agricultural-tower"]) do
  for _,condition in pairs(entity.surface_conditions or {}) do
    if condition.property == "solar-power" then
      condition.min = 1
    end
  end
end
