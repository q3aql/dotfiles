dotfiles - My tiling Qtile, spectrwm, i3 & sway configurations (for Arch/Devuan/Debian)
=======================================================================================

### My configurations:

* [Qtile](README-qtile.md)
* [Qtile (Widget)](README-qtile-widget.md)
* [i3 + polybar](README-i3-polybar.md)
* [i3 + i3status](README-i3.md)
* [i3 + i3blocks](README-i3-i3blocks.md)
* [sway](README-sway.md)
* [spectrwm](README-spectrwm.md)
* [spectrwm + polybar](README-spectrwm-polybar.md)

### Install dependencies on Arch Linux:

  ```shell
  $ sudo pacman -S spectrwm compton arc-gtk-theme xautolock kitty i3-gaps i3status \
  i3blocks i3lock noto-fonts papirus-icon-theme lxappearance nitrogen lxrandr tint2 \
  conky xterm exa fish bat zsh dmenu fzf calc rofi wofi picom engrampa ristretto \
  xarchiver mpv ffmpeg pcmanfm ranger vlc vim geany git nodejs alsa-utils arandr \
  python3 npm make cmake gcc cargo neofetch screenfetch lm_sensors pavucontrol \
  xfce4-screenshooter xscreensaver alsa-utils pulseaudio-alsa light xorg-xbacklight \
  xorg-xrandr sway swaybg swayidle wofi meson waybar wayland-protocols xorg-xwayland \
  wf-recorder xdg-desktop-portal-wlr wl-clipboard grim slurp jq wlroots pulseaudio \
  alacritty qtile python-pip
  ````
      
  ```shell
  $ cd /tmp
  $ git clone https://aur.archlinux.org/pacaur.git
  $ cd pacaur
  $ makepkg -si
  $ pacaur -S pnmixer polybar nerd-fonts-complete wdisplays wlr-randr-git
  ````
      
  * I use `iwd` instead of `NetWorkManager` (`don't install if you prefer or use NetWorkManager`):

  ```shell
  $ sudo pacman -S iwd
  ````
      
### Install dependencies on Debian/Devuan Linux:
      
  * Open the terminal and type the following commands:
    
  ```shell
  $ sudo apt-get install spectrwm i3 i3status i3blocks i3-wm i3pystatus i3lock i3lock-fancy \
  compton arc-theme breeze-cursor-theme xautolock x11-xserver-utils arandr kitty \
  fonts-noto papirus-icon-theme lxappearance nitrogen lxrandr pnmixer tint2 \
  conky xterm exa fish bat zsh dmenu fzf apcalc rofi picom engrampa ristretto \
  xarchiver mpv ffmpeg pcmanfm ranger vlc vim geany git nodejs node-base polybar \
  python3 npm make cmake gcc cargo neofetch screenfetch lm-sensors pavucontrol \
  xfce4-screenshooter xscreensaver alsa-utils pulseaudio-utils light xbacklight \
  sway swaybg swayidle wlr-randr wdisplays wofi meson waybar wl-clipboard \
  wayland-protocols libwlroots6 libcairo2 libpango-1.0-0 libgdk-pixbuf2.0-0 \
  libpcre++0v5 libjson-c5 xwayland libwayland-egl1-mesa libwayland-bin \
  xdg-desktop-portal-wlr wf-recorder weston
  ````
  
  ```shell
  $ git clone https://github.com/q3aql/dotfiles
  $ cd dotfiles/fonts
  $ sudo ./install-fonts.sh
  ````
      
  * For install `alacritty`, type this commands `(Optional)`:
   
  ```shell
  $ git clone https://github.com/q3aql/dotfiles
  $ cd dotfiles
  $ chmod +x scripts/alacritty-install.sh
  $ sudo scripts/alacritty-install.sh
  ````
    
  * For install `i3-gaps`, type this commands:
  
  ```shell
  $ git clone https://github.com/q3aql/dotfiles
  $ cd dotfiles
  $ chmod +x scripts/i3-gaps-install.sh
  $ sudo scripts/i3-gaps-install.sh
  ````

  * For install `qtile`, type this commands:
  
  ```shell
  $ sudo apt install xserver-xorg xinit
  $ sudo apt install libpangocairo-1.0-0
  $ sudo apt install python3-pip python3-xcffib python3-cairocffi
  $ pip install qtile
  ````
      
  * I use `Connman` instead of `NetWorkManager` (`don't install if you prefer or use NetWorkManager`):

  ```shell
  $ sudo apt-get install connman connman-gtk connman-ui connman-vpn
  ````
