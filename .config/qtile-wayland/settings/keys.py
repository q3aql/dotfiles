# Justine Smithies
# https://github.com/justinesmithies/qtile-wayland-dotfiles

# Key configuration

import os
from libqtile.config import Key
from libqtile.command import lazy

home = os.path.expanduser('~')
terminal = 'kitty'
mod = "mod4"

keys = [

    Key([mod], "g",
        lazy.screen.next_group(skip_empty=True),
        desc="Move to next active group"
        ),
    Key([mod, "shift"], "g",
        lazy.screen.prev_group(skip_empty=True),
        desc="Move to previous active group"
        ),
    # Switch between windows in current stack pane
    Key([mod], "k",
        lazy.layout.down(),
        desc="Move focus down in stack pane"
        ),
    Key([mod], "j",
        lazy.layout.up(),
        desc="Move focus up in stack pane"
        ),

    Key([mod, "shift"], "k",
        lazy.layout.shuffle_down(),
        desc='Shuffle down'
        ),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_up(),
        desc='Shuffle up'
        ),
    Key([mod, "shift"], "h",
        lazy.layout.shuffle_left(),
        desc='Shuffle left'
        ),
    Key([mod, "shift"], "l",
        lazy.layout.shuffle_right(),
        desc='Shuffle right'
        ),
    Key([mod, "mod1"], "j",
        lazy.layout.flip_down(),
        desc='Flip down'
        ),
    Key([mod, "mod1"], "k",
        lazy.layout.flip_up(),
        desc='Flip up'
        ),
    Key([mod, "mod1"], "h",
        lazy.layout.flip_left(),
        desc='Flip left'
        ),
    Key([mod, "mod1"], "l",
        lazy.layout.flip_right(),
        desc='Flip right'
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        desc='Grow down'
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        desc='Grow up'
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        desc='Grow left'
        ),
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        desc='Grow right'
        ),
    Key([mod], "n",
        lazy.layout.normalize(),
        desc='normalize window size ratios'
        ),
    Key([mod], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'
        ),
    Key([mod], "h",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
        ),
    Key([mod], "l",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
        ),

    # Toggle floating
    Key([mod, "shift"], "f", lazy.window.toggle_floating(),
        desc="Toggle floating"
        ),

    # Toggle Fullscreen
    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        lazy.hide_show_bar(position='all'),
        desc='Toggle fullscreen and the bars'
        ),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"
        ),

    # Swap panes of split stack
    Key([mod, "shift"], "space",
        lazy.layout.rotate(),
        desc="Swap panes of split stack"
        ),

    # ------------ App Configs ------------

    Key([mod], "o", lazy.spawn("rofi -show drun")),
    Key([mod], "p", lazy.spawn("rofi -show run")),
    Key([mod, "shift"], "w", lazy.spawn("rofi -show")),
    Key([mod], "b", lazy.spawn("firefox")),
    Key([mod], "n", lazy.spawn("pcmanfm")),
    Key([mod], "g", lazy.spawn("geany")),
    Key([mod], "m", lazy.spawn("telegram")),
    Key([mod], "z", lazy.spawn("nitrogen")),
    Key([mod], "u", lazy.spawn("xterm")),
    Key([mod], "t", lazy.spawn("rofi-theme-selector")),
    Key([mod], "i", lazy.spawn("lxappearance")),

    # Terminal
    Key([mod], "Return", lazy.spawn("kitty")),

    # Toggle between different layouts as defined below
    Key([mod], "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts"
        ),
    Key([mod], "w",
        lazy.window.kill(),
        desc="Kill focused window"
        ),

    # Toggle bars
    Key([mod], "b",
        lazy.hide_show_bar(position='all'),
        desc="Toggle bars"
        ),

    # Qtile system keys
    Key([mod, "control"], "r",
        lazy.reload_config(),
        desc="Restart qtile"
        ),
    Key([mod, "control"], "q",
        lazy.shutdown(),
        desc="Shutdown qtile"
        ),
    Key([mod], "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"
        ),
    Key([mod, "control"], "p",
        lazy.spawn("" + home + "/.config/qtile/scripts/powermenu"),
        desc="Launch Power menu"
        ),

    # Rofi
    Key(["control"], "space",
        lazy.spawn("rofi -show drun"),
        desc="Launch Rofi menu"
        ),
    # Window Switcher
    Key([mod, "control"], "w",
        lazy.spawn(home + "/.config/qtile/scripts/qtile-window-switcher.py"),
        desc="Launch the Window Switcher",
        ),

    # Cycle through windows in the floating layout
    Key([mod, "shift"], "i",
        lazy.window.toggle_minimize(),
        lazy.group.next_window(),
        lazy.window.bring_to_front()
        ),

    # ------------ Hardware Configs ------------
    # Volume
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    Key([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    # Brightness
    Key([], "XF86MonBrightnessDown",
        lazy.spawn(home + "/.local/bin/statusbar/brightnesscontrol down"),
        desc='Brightness down'
        ),
    Key([], "XF86MonBrightnessUp",
        lazy.spawn(home + "/.local/bin/statusbar/brightnesscontrol up"),
        desc='Brightness up'
        ),

    # Screenshots
    # Take a screenshot of all outputs and save it into screenshots
    Key([], "Print",
        lazy.spawn(home + "/.config/qtile/scripts/screenshot.sh"),
        desc='Save the screens of all outputs to the screenshots folder'
        ),
    # Take a screenshot of the selected region
    Key([mod], "Print",
        lazy.spawn(home + "/.config/qtile/scripts/screenshot.sh selected-region"),
        desc='Save the selected region of the screen to the screenshots folder'
        ),
    # Capture region of screen to clipboard
    Key([mod, "shift"], "Print",
        lazy.spawn(home + "/.config/qtile/scripts/screenshot.sh save-to-clipboard"),
        desc='Capture a region of the screen to the clipboard'
        ),
]

for i in range(1, 5):
    keys.append(Key(["control", "mod1"], "F"+str(i),
                    lazy.core.change_vt(i),
                    desc='Change to virtual console '+str(i)
                    ),)
