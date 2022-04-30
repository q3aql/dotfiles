#!/usr/bin/env python
#
# Qtile window switcher for Wayland only
#
# Justine Smithies - 2021
#
# Requirements are: qtile running under Wayland and rofi-lbonn-wayland-git

import subprocess
import os
import re
from libqtile.command.client import InteractiveCommandClient

client = InteractiveCommandClient()
windows = client.windows()
# Get the number of open windows
lines = (len(windows))
x = 0
names = []
ids = []
groups = []
appids = []
while x < lines:
    # client.window[window_id].focus() etc
    win = windows[x]
    name = win.get("name")
    names.append(name)
    id = win.get("id")
    ids.append(id)
    group = win.get("group")
    groups.append(group)
    appid = win.get("wm_class")[0]
    appids.append(appid)
    print(name, id, group, appid)
    x += 1
print(windows)

# Reverse the tuples
ids = ids[::-1]
groups = groups[::-1]
names = names[::-1]
appids = appids[::-1]

# Combine all the information into a string to be piped through rofi -dmenu
d = dict(os.environ)
outputs = []
output = []
icon = []
x = 0
print(lines)
while x < lines:
    id = ids[x]
    id = str(id)
    appid = (appids[x]).strip('\n')
    name = names[x]
    # If name is > 40 characters then shorten it to max 40 and append ...
    if len(name) > 40:
        name = name[:40] + '...'
    group = groups[x]
    # Hacky fix to get correct icon for appids that begin with org.
    if 'org.' in appid:
        icon = appid.split(".")
        icon = str(icon[2].lower())
    else:
        icon = appid
    output = ' ' + appid + ' - ' + name + ' on group: ' + group + ' (' + id + ')' + r'\0icon\x1f' + icon + '\n'
    outputs.append(str(output))
    x += 1

outputs = ''.join(outputs)
# Remove last blank line
outputs = os.linesep.join([s for s in outputs.splitlines() if s])
print(outputs)

# Send options to rofi
d["OPTIONS"] = outputs
d["LINES"] = str(lines)
result = subprocess.Popen('echo -e "$OPTIONS" | rofi -theme themes/windowswitcher.rasi -i -dmenu -l $LINES -mesg "Window Switcher"', shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, env=d)

# Get selected option and process
selected_option = str(result.communicate())
print(selected_option)
# Search for the content between the last set of brackets
selected_option = re.sub('^.*\((.*?)\)[^\(]*$', '\g<1>', selected_option)
print(selected_option)
if True in [char.isdigit() for char in selected_option]:
    selected_option = int(selected_option)
    client.window[selected_option].group.toscreen()
    client.window[selected_option].focus()
    exit()
else:
    exit()
