-- Joyful's Hyprland look. While Joyful is the active theme, Omarchy loads this
-- file in place of the border colors it would otherwise generate from
-- colors.toml; switching to another theme drops all of it again.
--
-- Omarchy never runs Lua from a theme installed with `omarchy theme install`,
-- so this only takes effect when the theme folder is not a git clone (see the
-- README's "Hyprland look" section).

-- Maroon border, as a soft two-stop gradient; inactive windows keep Omarchy's
-- default gray.
local active_border = { colors = { "0xFF842E36", "0xFF8A3840" }, angle = 45 }
local inactive_border = "rgba(595959aa)"

hl.config({
  general = {
    gaps_in = 3,
    gaps_out = 6,
    border_size = 2,
    resize_on_border = true,
    extend_border_grab_area = 15,
    hover_icon_on_border = true,
    col = {
      active_border = active_border,
      inactive_border = inactive_border,
    },
  },

  group = {
    col = {
      border_active = active_border,
      border_inactive = inactive_border,
    },
  },

  decoration = {
    rounding = 12,
    rounding_power = 2,
    active_opacity = 0.98,
    inactive_opacity = 0.94,
    fullscreen_opacity = 1,

    blur = {
      enabled = true,
      size = 10,
      passes = 2,
      noise = 0.015,
      brightness = 1.07,
      vibrancy_darkness = 0.09,
    },
  },

  misc = {
    -- Shown wherever no wallpaper is drawn: Joyful's darkest pine.
    background_color = 0x09160F,
  },
})

-- Animations: quick, soft pop-ins and slides.
hl.curve("joyEmphasis", { type = "bezier", points = { { 0.15, 0.6 }, { 0.1, 1 } } })
hl.curve("joyEnter", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })
hl.curve("joyExit", { type = "bezier", points = { { 0.4, 0 }, { 1, 1 } } })
hl.curve("joyMove", { type = "bezier", points = { { 0.3, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "border", enabled = true, speed = 4.29, bezier = "joyMove" })
hl.animation({ leaf = "fade", enabled = true, speed = 1.86, bezier = "joyExit" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.65, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.7, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.32, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "global", enabled = true, speed = 9.52, bezier = "default" })
hl.animation({ leaf = "layers", enabled = true, speed = 1.43, bezier = "joyEnter", style = "fade" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.81, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.43, bezier = "linear", style = "fade" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "joyMove", style = "slidevert" })
hl.animation({ leaf = "windows", enabled = true, speed = 1.71, bezier = "joyEnter", style = "popin 90%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.9, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.42, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "joyMove", style = "slide" })

-- Blur behind the Omarchy bar, and behind the menu and Apps-grid cards (their
-- full-screen dimming scrims stay sharp: ignore_alpha skips the scrim pixels).
hl.layer_rule({ match = { namespace = "omarchy-bar" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "omarchy-menu" }, blur = true, ignore_alpha = 0.75 })
hl.layer_rule({ match = { namespace = "omarchy-dock-apps" }, blur = true, ignore_alpha = 0.75 })
