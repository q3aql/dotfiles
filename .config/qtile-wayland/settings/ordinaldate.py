# Justine Smithies
# https://github.com/justinesmithies/qtile-wayland-dotfiles

# Ordinal Date - Displays date in format Friday 11th March 2022 - 14:53

# Add th, nd or st to the date - use custom_date in text box to display

from datetime import datetime as dt


def suffix(d):
    return 'th' if 11 <= d <= 13 else {1: 'st', 2: 'nd', 3: 'rd'}.get(d % 10, 'th')


def custom_strftime(format, t):
    return t.strftime(format).replace('{S}', str(t.day) + suffix(t.day))


def custom_date():
    return custom_strftime('%A {S} %B %Y - %H:%M', dt.now())
