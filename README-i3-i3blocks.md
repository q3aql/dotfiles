dotfiles - My tiling i3 WM Configuration (for Devuan/Debian)
============================================================

### My configurations:

* [spectrwm](README.md)
* [i3 + i3status](README-i3.md)
* [i3 + i3blocks](README-i3-i3blocks.md)

![i3WM](examples/i3wm.png)

### Installation:

  * **`Install dependencies:`**
  
    * Open the terminal and type the following commands:
    
      ```shell
      $ sudo apt-get install i3 i3status i3blocks i3-wm i3pystatus i3lock i3lock-fancy \
        compton arc-theme breeze-cursor-theme fonts-noto papirus-icon-theme lxappearance \
        nitrogen lxrandr pnmixer conky xterm exa fish bat zsh dmenu fzf apcalc rofi picom \
        engrampa xarchiver mpv ffmpeg pcmanfm ranger vlc vim geany git nodejs node-base \
        python3 npm make cmake gcc cargo neofetch screenfetch lm-sensors pavucontrol \
        xfce4-screenshooter xscreensaver alsa-utils ristretto
      ````
    * I use `Connman` instead of `NetWorkManager` (`don't install if you prefer or use NetWorkManager`):

      ```shell
      $ sudo apt-get install connman connman-gtk connman-ui connman-vpn
      ````
      
  * **`Install alacritty and i3-gaps (Optional):`**
  
    * Clone repository and run the scripts for installation:

      ```shell
      $ git clone https://github.com/q3aql/dotfiles
      $ cd dotfiles
      $ chmod +x alacritty-install.sh
      $ sudo ./alacritty-install.sh
      ````
      
      ```shell
      $ chmod +x i3-gaps-install.sh
      $ sudo ./i3-gaps-install.sh
      ````

  * **`Install configuration (dotfiles):`**
  
    * Clone repository and copy files to your home:

      ```shell
      $ git clone https://github.com/q3aql/dotfiles
      $ cd dotfiles
      $ cp -rfv .* ~/
      $ cp -rfv * ~/
      $ cp -rfv ~/.config/i3/config.i3blocks ~/.config/i3/
      ````

### Configuration:

  * **`Network Manager (Connman or NetWorkManager):`**
  
    * By default is enabled `NetWorkManager` as network manager:
    * If you prefer NetWorkManager, edit the file `~/.config/i3/config`:
    
      ```shell
      #exec --no-startup-id connman-gtk --tray &
      exec --no-startup-id nm-applet &
      ````

  * **`Monitor & resolution:`**
  
    * The configuration load my monitor configuration:
    * Use the command `xrandr` for show your config & edit the file `~/.config/i3/startxrandr.sh`:
    
      ```shell
      sleep 2
      xrandr --output DisplayPort-0 --mode 1280x1024 -r 75.02
      xrandr --output DisplayPort-1 --mode 1280x1024 -r 75.02 --rotate left --right-of DisplayPort-0
      ````

  * **`Wallpaper:`**
  
    * By default, the config load wallpaper on `~/wallpapers/abstract.png`:
    * Edit  `~/.config/i3/config` for set your favorite wallpaper:
    
      ```shell
      exec --no-startup-id "sleep 3 && nitrogen --set-scaled ~/wallpapers/abstract.png"
      ````

  * **`Enable Gaps (Optional):`**
  
    * My config work on vanilla i3wm and gaps are disabled.
    * You can enable it editing 2 lines on file `~/.config/i3/config` and pressing `Win+Shift+r`:
    
      ```shell
      #gaps inner 6
      #gaps outer 2
      ````

  * **`Battery Indicator:`**
  
    * By default, the battery indicator is disabled on i3blocks top bar.
    * You can enable it editing the lines on `~/.config/i3blocks/config` file:
    
      ```shell
      #[BATTERY]
      #command=~/.config/i3blocks/battery/battery_info.sh
      #interval=3
      ````
      
### Keys configuration:

My list of extra combinations:

    - Super + d = Open Dmenu
    - Super + p = Open Rofi (run mode)
    - Super + q = Open Rofi (window mode)
    - Super + o = Open Rofi (drun mode)
    - Super + b = Open Firefox
    - Super + n = Open PCManFM
    - Super + t = Open Rofi Theme Selector
    - Super + g = Open Geany
    - Super + m = Open Telegram 
    - Super + z = Open Nitrogen 
    - Super + x = Open LXRandr
    - Super + u = Open Xterm
    - Super + i = Open LXAppearance
    - Super + c = Open NetWorkManager
    - Volume-Up = Volume +5
    - Volume-Down = Volume -5
    - VolumeMute = Mute Volume
    - Super + Ctrl + Shift + e = Poweroff screen
    - Super + Shit + e = Logout
    - Super + Backspace = Open menu Logout/Lock/Reboot/Shutdown

### External links:

* [Antonio Sarosi](https://github.com/antoniosarosi/dotfiles/)
* [Derek Taylor](https://gitlab.com/dwt1/dotfiles/)
* [TWB0109](https://github.com/TWB0109/PDots)
* [i3-style](https://github.com/altdesktop/i3-style)
* [addy-dclxvi](https://github.com/addy-dclxvi/i3-starterpack)
* [i3-gaps](https://github.com/Airblader/i3)
