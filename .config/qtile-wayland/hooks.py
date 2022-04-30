# Qtile Config File
# http://www.qtile.org/

# Justine Smithies
# Hooks configuration

import os
import subprocess
import time
from libqtile import qtile
from libqtile import hook

from groups import groups
from libqtile.log_utils import logger


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

# Get the number of connected screens

# @hook.subscribe.screens_reconfigured


def get_monitors():
    xr = qtile.screens
    result = len(xr) - 1 if len(xr) > 2 else len(xr)
    if result <= 0:
        result = 1
    logger.warning(f"Number of monitors: {result}")
    return result


# When application launched automatically focus it's group

@hook.subscribe.client_new
def modify_window(client):
    for group in groups:  # follow on auto-move
        match = next((m for m in group.matches if m.compare(client)), None)
        if match:
            targetgroup = client.qtile.groups_map[group.name]  # there can be multiple instances of a group
            targetgroup.cmd_toscreen(toggle=False)
            break

# Hook to fallback to the first group with windows when last window of group is killed


# @hook.subscribe.client_killed
# def fallback(window):
    #     if window.group.windows != [window]:
#    if isinstance(window, base.Static) or window.group.windows != [window]:
#        return
#    idx = qtile.groups.index(window.group)
#    for group in qtile.groups[idx - 1::-1]:
#        if group.windows:
#            qtile.current_screen.toggle_group(group)
#            return
#    qtile.current_screen.toggle_group(qtile.groups[0])

# Work around for matching Spotify


@hook.subscribe.client_new
def slight_delay(window):
    time.sleep(0.04)

# If Spotify opens move it to group 6


@hook.subscribe.client_name_updated
def spotify(window):
    if window.name == 'Spotify':
        window.cmd_togroup(group_name='阮 ₆')

# If mpv opens float it at pos x, y, w, h, borderwidth, border color


@hook.subscribe.client_managed
def repos(window):
    if window.get_wm_class() and 'mpv' in window.get_wm_class():
        window.floating = True
        window.place(1200, 650, 640, 360, 2, "#ffffff")
