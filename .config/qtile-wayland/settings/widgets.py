# Justine Smithies
# https://github.com/justinesmithies/qtile-wayland-dotfiles

# Widgets setup
# Get the icons at https://www.nerdfonts.com/cheat-sheet

import psutil
#import os
#import subprocess
from libqtile import qtile
from libqtile import widget
#from colors import *
from .theme import colors
#from ordinaldate import custom_date
from keys import terminal


def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)

def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )

def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=37,
        padding=-2.1
    )

def workspaces(): 
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='UbuntuMono Nerd Font',
            fontsize=15,
            #font='Liberation Mono',
            #fontsize=14,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        separator(),
        widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
        separator(),
    ]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()

primary_widgets = [
    *workspaces(),

    separator(),
    powerline('color5', 'dark'),
    icon(bg="color5", text=' '), # Icon: nf-fa-download
    
    widget.CheckUpdates(
        background=colors['color5'],
        colour_have_updates=colors['text'],
        colour_no_updates=colors['text'],
        no_update_string='0',
        foreground='222222',
        display_format='{updates}',
        update_interval=1800,
        #custom_command='checkupdates',
        custom_command='bash ~/.config/qtile/checkUpdates.sh',
        execute='bash ~/.config/qtile/checkUpdates.sh',
    ),

    powerline('color2', 'color5'),
    icon(bg="color2", text=' '), # Icon: nf-fae-chipnf-fae-chip
    
    widget.CPU(
        background=colors['color2'],
        foreground='222222',
        update_interval=1.5,
        format='{load_percent}% '
    ),

    widget.ThermalSensor(
        background=colors['color2'],
        foreground='222222',
        update_interval=2.0,
        tag_sensor="Tctl",
    ),

    powerline('color3', 'color2'),
    icon(bg="color3", text=' '),  # Icon: nf-mdi-memory

    widget.Memory(
        background=colors['color3'],
        foreground='222222',
        measure_mem='G',
        format='{MemUsed:.0f}{mm}/{MemTotal:.0f}{mm} ',
        update_interval=2.0,
    ),

    powerline('color5', 'color3'),
    icon(bg="color5", text=' '),  # Icon: nf-fa-volume_up

    widget.Volume(
        background=colors['color5'],
        foreground='222222',
        channel='Master',
        fmt='{}',
        update_interval=0.2,
    ),

    powerline('color2', 'color5'),

    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='color2'), padding=5),

    powerline('color1', 'color2'),

    icon(bg="color1", fontsize=17, text=' '), # Icon: nf-mdi-calendar_clock

    widget.Clock(**base(bg='color1'), format='%d/%m/%Y %H:%M '),

    powerline('dark', 'color1'),
]

secondary_widgets = [
    *workspaces(),

    separator(),

    powerline('color2', 'dark'),

    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='color2'), padding=5),

    powerline('color1', 'color2'),

    icon(bg="color1", fontsize=17, text=' '), # Icon: nf-mdi-calendar_clock

    widget.Clock(**base(bg='color1'), format='%d/%m/%Y %H:%M '),

    powerline('dark', 'color1'),
]
