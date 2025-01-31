data:extend({
  {
    type = "noise-expression",
    name = "aquilo_starting_seabloom",
    expression = "starting_spot_at_angle{angle = aquilo_angle + 120, distance = 80, radius = aquilo_spot_size * 0.6, x_distortion = 0, y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "aquilo_seabloom_probability",
    expression = "(control:seabloom:size > 0)\z
                  * (max(aquilo_starting_seabloom * 0.2,\z
                         min(aquilo_starting_mask, aquilo_seabloom_spots) * 0.12))"
  },
  {
    type = "noise-expression",
    name = "aquilo_seabloom_spots",
    expression = "aquilo_spot_noise{seed = 566,\z
                                    count = 3,\z
                                    skip_offset = 1,\z
                                    region_size = 600 + 400 / control:seabloom:frequency,\z
                                    density = 1,\z
                                    radius = aquilo_spot_size * 1.2 * sqrt(control:seabloom:size),\z
                                    favorability = 1}"
  },
})
