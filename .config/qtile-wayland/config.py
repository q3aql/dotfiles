# Qtile Config File
# http://www.qtile.org/

# Justine Smithies
# https://github.com/justinesmithies/qtile-wayland-dotfiles

from typing import List  # noqa: F401
import hooks
from settings.keys import mod, keys, home
from settings.workspaces import workspaces
from settings.groups import groups
from settings.layouts import layouts
from settings.widgets import widget_defaults, extension_defaults
from settings.screens import screens
from settings.mouse import mouse

# Configure input devices
try:
    from libqtile.backend.wayland import InputConfig

    wl_input_rules = {
        "type:keyboard": InputConfig(
            #kb_layout='us',
            kb_layout='es',
        ),
    }
except ImportError:
    wl_input_rules = None

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"
