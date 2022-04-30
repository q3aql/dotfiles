# Justine Smithies
# https://github.com/justinesmithies/qtile-wayland-dotfiles

# Workspace setup
# Get the icons at https://www.nerdfonts.com/cheat-sheet

from libqtile.config import Match

workspaces = [
    {
        "name": "term",
        "key": "1",
        "matches": [
            Match(wm_class='xterm'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": "www",
        "key": "2",
        "matches": [
            Match(wm_class='firefox'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": "chat",
        "key": "3",
        "matches": [
            Match(wm_class='telegram-desktop'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": "files",
        "key": "4",
        "matches": [
            Match(wm_class='pcmanfm'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": "media",
        "key": "5",
        "matches": [
            Match(wm_class='gimp-2.99'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": "game",
        "key": "6",
        "matches": [
            Match(wm_class='steam'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": "mail",
        "key": "7",
        "matches": [
            Match(wm_class='electronmail'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": "dev",
        "key": "8",
        "matches": [
            Match(wm_class='nvim'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": "vm",
        "key": "9",
        "matches": [
            Match(wm_class='virtualbox'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
]
