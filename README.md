# arch-config

<img src=".\setup.png" alt="Setup">

My beautiful arch configuration.

Uh, because I don't know how to setup the Git LFS so I think you can handle it by using the .tar file.

So, the installation is very simple

# Installation

Take a quick look to the [text.txt](https://github.com/imindMan/arch-config/blob/master/text.txt) and you'll see a link.

Copy that link and download the .tar file from Google Drive. 

Unzip it by using: `tar –xf config.tar` and then replace the output folder to the ~/.config directory

Move on to extra installation

# Extra installation
Qtile: `sudo pacman -S qtile lxappearance lightdm lightdm-gtk-greeter`. After installation, run `sudo systemctl enable lightdm.service` and edit the `display_setup_script` variable in the /etc/lightdm/lightdm.conf (if you are using Virtual Machine) to `xrandr --output Virtual-1 --mode 1280x800`

Nerd-font: `sudo pacman -S ttf-hack-nerd` then `cd /usr/share/fonts/TTF` then `fc-cache -fv` 

Text editor: `sudo pacman -S neovim nano mousepad neovide sqlitebrowser`

Typing keys: `sudo pacman -S ibus`. Also `ibus-bamboo` because I type in vietnamese!

Htop: `sudo pacman -S htop`

Neofetch: `sudo pacman -S neofetch`

File explorer: `sudo pacman -S ranger thunar`

sound system: `sudo pacman -S alsa-utils`

terminal: `sudo pacman -S kitty`

starship: `sudo pacman -S starship`. My starship configuration is just another "update" of the tokyo-night preset that fits my own taste

terminal-theme: i use this package [dexpota/kitty-themes](https://github.com/dexpota/kitty-themes). You don't have to manual configure the theme again, because I already did that!
 
search-engine: `sudo pacman -S rofi`

picom: `yay -S picom-ibhagwan-git`. Note: if you use Virtual Machine, just keep my settings. But if you use real machine, be sure to change the vsync variable in the ~/.config/picom/picom.conf to true.

music-player: `sudo pacman -S mpd ncmpcpp`. Also `sudo pacman -S tty-clock` for extra personality.

extra: `sudo pacman -S python python-pip nodejs shutter obs-studio mplayer` and `pip install psutil poetry`

my wallpaper: [Wallpaper](https://images8.alphacoders.com/749/749455.png)

# Ending
That's kinda enough for my setup, if you like it, please give me a star to appreciate it! Thank you so much!
