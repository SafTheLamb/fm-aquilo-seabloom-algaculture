data:extend({
  {
    type = "noise-expression",
    name = "aquilo_seabloom_noise",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 700000, octaves = 3, input_scale = 1/20 * control:seabloom:frequency }\z
                      * multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 200000, octaves = 3, input_scale = 1/6 * control:seabloom:frequency })"
  },
  {
    type = "noise-expression",
    name = "aquilo_seabloom_noise_b",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 750000, octaves = 3, input_scale = 1/20 * control:seabloom:frequency }\z
                      * multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 250000, octaves = 3, input_scale = 1/6 * control:seabloom:frequency })"
  },
  {
    type = "noise-expression",
    name = "aquilo_seabloom_cutoff",
    expression = "aquilo_elevation + 3"
  },
})
