local sounds = require("__base__.prototypes.entity.sounds")

local snack_duration = 2*second
local snack_cooldown = 3*second
local snack_instant_health = 40
local snack_regen_health = 4
local snack_regen_interval = 0.25*second

local function make_sticker_data()
  return {
    {
      type = "sticker",
      name = "seaweed-snack-regen-sticker",
      flags = {"not-on-map"},
      hidden = true,
      single_particle = true,
      duration_in_ticks = snack_duration,
      damage_interval = snack_regen_interval,
      damage_per_tick = {amount=-snack_regen_health, type="physical"},
      animation = util.sprite_load("__space-age__/graphics/sticker/yumako-regen/regen-front", {
        priority = "high",
        frame_count = 50,
        scale = 0.5,
        animation_speed = 0.5,
        shift = util.by_pixel(0,16)
      })
    },
    {
      type = "sticker",
      name = "seaweed-snack-regen-sticker-behind",
      flags = {"not-on-map"},
      hidden = true,
      single_particle = true,
      duration_in_ticks = snack_duration,
      render_layer = "object-under",
      animation = {
        layers = {
          util.sprite_load("__space-age__/graphics/sticker/yumako-regen/regen-ground", {
            priority = "high",
            frame_count = 50,
            scale = 0.5,
            draw_as_glow = true
          }),
          util.sprite_load("__space-age__/graphics/sticker/yumako-regen/regen", {
            priority = "high",
            frame_count = 50,
            scale = 0.5,
            draw_as_glow = true
          })
        }
      }
    }
  }
end

local function make_heal_capsule_effect()
  return {
    type = "use-on-self",
    attack_parameters = {
      type = "projectile",
      activation_type = "consume",
      ammo_category = "capsule",
      cooldown = snack_cooldown,
      range = 0,
      ammo_type = {
        target_type = "position",
        action = {
          type = "direct",
          action_delivery = {
            type = "instant",
            target_effects = {
              {
                type = "damage",
                damage = {type="physical", amount=-snack_instant_health},
                use_substitute = false
              },
              {
                type = "create-sticker",
                sticker = "seaweed-snack-regen-sticker",
                show_in_tooltip = true
              },
              {
                type = "create-sticker",
                sticker = "seaweed-snack-regen-sticker-behind"
              },
              {
                type = "play-sound",
                sound = sounds.eat_fish,
              }
            }
          }
        }
      }
    }
  }
end

return {
  data = make_sticker_data(),
  seaweed_snack_regen = make_heal_capsule_effect()
}
