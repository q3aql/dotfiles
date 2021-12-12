dotfiles - My tiling sway configuration (for Devuan/Debian)
====================================================================

### My configurations:

* [spectrwm](README.md)
* [spectrwm + polybar](README-spectrwm-polybar.md)
* [i3 + i3status](README-i3.md)
* [i3 + i3blocks](README-i3-i3blocks.md)
* [i3 + polybar](README-i3-polybar.md)
* [sway](README-sway.md)

![sway](examples/sway.png)

### Installation:

  * **`Install dependencies:`**
  
    * Open the terminal and type the following commands:
    
      ```shell
      $ sudo apt-get install sway swaybg wlr-randr wdisplays wofi meson waybar \
        wayland-protocols libwlroots6 libcairo2 libpango-1.0-0 libgdk-pixbuf2.0-0 \
        libpcre++0v5 libjson-c5 xwayland libwayland-egl1-mesa libwayland-bin \
        xdg-desktop-portal-wlr wf-recorder arc-theme breeze-cursor-theme fonts-noto \
        papirus-icon-theme lxappearance weston slurp grim jq wl-clipboard pnmixer conky \
        xterm exa fish bat zsh dmenu fzf apcalc rofi engrampa xarchiver mpv ffmpeg \
        pcmanfm ranger vlc vim geany git nodejs node-base python3 npm make cmake gcc cargo \
        neofetch screenfetch lm-sensors pavucontrol xscreensaver alsa-utils ristretto
      ````
    * I use `Connman` instead of `NetWorkManager` (`don't install if you prefer or use NetWorkManager`):

      ```shell
      $ sudo apt-get install connman connman-gtk connman-ui connman-vpn
      ````
      
  * **`Install alacritty:`**
  
    * Clone repository and run the scripts for installation:

      ```shell
      $ git clone https://github.com/q3aql/dotfiles
      $ cd dotfiles
      $ chmod +x alacritty-install.sh
      $ sudo ./alacritty-install.sh
      ````
      
  * **`Install configuration (dotfiles):`**
  
    * Clone repository and copy files to your home:

      ```shell
      $ git clone https://github.com/q3aql/dotfiles
      $ cd dotfiles
      $ cp -rfv .* ~/
      $ cp -rfv * ~/
      ````

### Configuration:

  * **`Network Manager (Connman or NetWorkManager):`**
  
    * By default is enabled `NetWorkManager` as network manager:
    * If you prefer NetWorkManager, edit the file `~/.config/sway/config`:
    
      ```shell
      #exec --no-startup-id connman-gtk --tray &
      exec --no-startup-id nm-applet &
      ````

  * **`Monitor & resolution:`**
  
    * The configuration load my monitor configuration:
    * Use the command `wlr-randr` for show your config & edit the file `~/.config/sway/startwlrrandr.sh`:
    
      ```shell
      wlr-randr --output DP-1 --custom-mode 1280x1024@75Hz --pos 288,0
      wlr-randr --output DP-2 --custom-mode 1280x1024@75Hz --transform 90 --pos 1568,0
      ````

  * **`Screensaver:`**
  
    * The configuration file use my monitor configuration and set the time in 15 minutes:
    * Use the command `wlr-randr` for show your monitors & edit the file `~/.config/sway/startwlrscreensaver.sh`:
    
      ```shell
      # Basic configuration variables
      ScreensaverTime="900" # 15 minutes
      monitorOne="DP-1" # First monitor
      monitorTwo="DP-2" # Second monitor
      monitorThree="" # Third monitor
      ````

 * **`Wallpaper:`**
  
    * By default, the config load wallpaper on `~/wallpapers/dark-city.jpg`:
    * Edit  `~/.config/sway/config` for set your favorite wallpaper:
    
      ```shell
      exec --no-startup-id "swaybg -i ~/wallpapers/dark-city.jpg -m fill"
      ````

  * **`Layout:`**
  
    * By default, the config load my spanish layout.:
    * Edit  `~/.config/sway/config` for set your configuration:
    
      ```shell
      # Input layout
      input * {
        #xkb_layout "us"
        xkb_layout "es"
        #xkb_variant "colemak"
      }
      ````

### Keys configuration:

My list of extra combinations:

    - Super + d = Open Dmenu
    - Super + p = Open Wofi (run mode)
    - Super + q = Open Rofi (window mode)
    - Super + o = Open Wofi (drun mode)
    - Super + b = Open Firefox
    - Super + n = Open PCManFM
    - Super + t = Open Wayland-Screenshooter
    - Super + g = Open Geany
    - Super + m = Open Telegram 
    - Super + z = Open Wf-Recorder (Screen video recorder) 
    - Super + x = Open Wdisplays
    - Super + u = Open Xterm
    - Super + i = Open LXAppearance
    - Super + c = Open NetWorkManager
    - Volume-Up = Volume +5
    - Volume-Down = Volume -5
    - VolumeMute = Mute Volume
    - Super + Ctrl + Shift + l = Poweroff/Start screen (Screensaver step needed)
    - Super + Shift + e = Logout
    - Super + Backspace = Open menu Logout/Reboot/Shutdown

### External links:

* [Antonio Sarosi](https://github.com/antoniosarosi/dotfiles/)
* [Derek Taylor](https://gitlab.com/dwt1/dotfiles/)
* [TWB0109](https://github.com/TWB0109/PDots)
* [i3-style](https://github.com/altdesktop/i3-style)
* [addy-dclxvi](https://github.com/addy-dclxvi/i3-starterpack)
* [i3-gaps](https://github.com/Airblader/i3)
