static const Block blocks[] = {
//   Icon    Command                                    Update Interval     Update Signal
    { " ",   "~/.config/dwm/scripts/checkUpdates.sh",         1800,             0 },
    { " ",   "~/.config/dwm/scripts/kernel_version.sh",       60,               0 },
    { " ",   "~/.config/dwm/scripts/cpu_info.sh",             2,                0 },
    { " ",   "~/.config/dwm/scripts/disk_info.sh",            30,               0 },
    { " ",   "~/.config/dwm/scripts/mem_info.sh",             5,                0 },
    { "",     "date '+ %d/%m/%Y %H:%M%p'",                    5,                0 },
};

// Sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "  ";
static unsigned int delimLen = 5;
