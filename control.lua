local function on_configuration_changed(event)
	local aquilo = game.get_surface("aquilo")
	--game.get_surface("aquilo").map_gen_settings.autoplace_controls["seabloom"]
	if aquilo then
		if not aquilo.map_gen_settings.autoplace_controls["seabloom"] then
			local map_gen_settings = aquilo.map_gen_settings
			map_gen_settings.autoplace_controls["seabloom"] = {}
			map_gen_settings.autoplace_settings["entity"].settings["seabloom-cluster"] = {}
			aquilo.map_gen_settings = map_gen_settings
		end
	end
end

script.on_configuration_changed(on_configuration_changed)
