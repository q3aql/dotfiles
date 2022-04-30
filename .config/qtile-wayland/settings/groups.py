# Justine Smithies
# https://github.com/justinesmithies/qtile-wayland-dotfiles

# Groups configuration

from libqtile.config import Key, Group
from libqtile.command import lazy
from keys import mod, keys
from workspaces import workspaces
from screens import connected_monitors

groups = []
for workspace in workspaces:
    matches = workspace["matches"] if "matches" in workspace else None
    layouts = workspace["layout"] if "layout" in workspace else None
    groups.append(Group(workspace["name"], matches=matches, layout=layouts))
    keys.append(Key([mod], workspace["key"], lazy.group[workspace["name"]].toscreen()))
    keys.append(Key([mod, "shift"], workspace["key"], lazy.window.togroup(workspace["name"])))

for i in range(connected_monitors):
    keys.extend([Key([mod, "mod1"], str(i), lazy.window.toscreen(i))])
