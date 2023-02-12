Table of content:

  - [Preview](#preview)
  - [About](#about)
  - [Installation](#install)
     + [Qtile](#wm)
     + [GTK Theme](#GTK-theme)
     + [Terminal](#terminal)
     + [File manager](#file-manager)
     + [Task manager](#task-manager)
     + [Search engine](#search-engine)
     + [Ibus](#ibus)
     + [Fetching program](#fetch)
     + [Text editor](#text-editor)
     + [Window compositor](#compositor)
     + [Cool terminal](#cool-terminal)
     + [Font](#font)
     + [Fun stuff](#fun-stuff)
     + [Extra](#extra)
     + [Final configuration](#final)
  - [Contribution](#contribution)
  - [Inspiration](#inspiration)

<h1 id="preview">Preview</h1>

![](https://github.com/imindMan/arch-config/blob/master/setup.png)

<h1 id="about">About</h1>

This is my main Arch configuration. Including some cool programs and cool setups that I have found on the internet!

Mainly blue. Nord-theme inspired. 1440x900 Resolution, mainly configured in VM.

I don't know if anything broken on the repo lmao :))).

<h1 id="install">Installation</h1>

Assuming you are using tty and almost empty arch.

<h2 id="wm">Qtile</h2>

I use Qtile window manager (a tiling window manager) and also lightdm for display manager.

Install in arch: 

`$ sudo pacman -S qtile lxappearance lightdm lightdm-gtk-greeter`

Configuring the `/etc/lightdm/lightdm.conf` as you want to. Quick setup `display-setup-script = xrandr --output <YOUR-DISPLAY-NAME> --mode <YOUR-RESOLUTION>`

Enable using systemd `systemctl enable lightdm.service` then reboot.

For configuring the login screen, you can use `lightdm-gtk-greeter-settings` package `sudo pacman -S lightdm-gtk-greeter-settings`.

<h2 id="GTK-theme">GTK Theme</h2>

For GTK theme, I use Midnight theme https://www.gnome-look.org/p/1273208/ with BeautyLine icon theme https://www.gnome-look.org/p/1425426/. (beautiful)

Start by downloading the .tar file you want to, then extract that in the `/usr/share/themes` and `/usr/share/icons`. Then open up the "Customize Look and Feel", browsing the "Widget" and "Icon theme" then choose the suitable theme you wanna use.


<h2 id="terminal">Terminal</h2>

I use kitty terminal emulator `sudo pacman -S kitty`

<h2 id="file-manager">File manager</h2>

I use thunar and ranger `sudo pacman -S thunar ranger`

<h2 id="task-manager">Task manager</h2>

`btop` go brrrrrrrrrrrrrr `sudo pacman -S btop`.

<h2 id="search-engine">Search engine</h2>

Rofi is the best case for me actually `sudo pacman -S rofi`

<h2 id="ibus"> Ibus</h2>

For input system, I use `ibus` and `ibus-bamboo` for typing in Vietnamese `sudo pacman -S ibus` and `bash -c "$(curl -fsSL https://raw.githubusercontent.com/BambooEngine/ibus-bamboo/master/archlinux/install.sh)"`. 

Also from this point, you now need `yay` for aur package.

<h2 id="fetch">Fetching program</h2>

I use `neofetch` `sudo pacman -S neofetch`.

<h2 id="text-editor">Text editor</h2>

`sudo pacman -S neovim neovide mousepad` (also vim-plug and `pip install neovim` and `npm install neovim -g`)

<h2 id="compositor">Window compositor</h2>

`yay -S picom-animations-git` (this fork is amazing)

Also, change `vsync = true`, `backend=glx`, and `experimental-backend=true` if you are not using vm (you can skip this for now until you finally download all the config directory).

<h2 id="cool-terminal">Cool terminal</h2>

Starship probably so good!!!!! `sudo pacman -S starship`

<h2 id="font">Font</h2>

I'm a big fan of hack nerd font `sudo pacman -S ttf-hack-nerd`

<h2 id="fun-stuff">Fun</h2>

I use ncmpcpp, mpd, and cava for music stuff `sudo pacman -S mpd ncmpcpp` and `yay -S cava`

Further installation you can read on the official wiki.

Clock: `yay -S tty-clock`

Bonsai tree: `yay -S cbonsai-git`

Cool over-engineered: `cargo install --git https://github.com/lhvy/pipes-rs`

<h2 id="extra">Extra</h2>

`sudo pacman -S python python-pip nodejs obs-studio shutter rust` and `pip install psutil`

<h2 id="final">Final configuration</h2>

Clone the config repository to ~/.config.

```bash
git clone https://github.com/imindMan/arch-config.git
mv ~/arch-config/config ~/.config
```

Edit some files and install some packages as you want to.

Setting up the .bashrc and .xprofile

```bash
mv ~/arch-config/startup_script/.bashrc ~/arch-config/startup_script/.xprofile ~
```

And now, you can use this setup as you want to!

<h2 id="contribution">Contribution</h2>

If you want to contribute to this project, just fork them locally in your github and make a pr. Also you can make some issues if you want to.

I will consider all your help

<h2 id="inspiration">Inspiration</h2>

This setup is inspired by a lot of cool setups in r/unixporn and other linux rice complication videos on Youtube.

Qtile theme settings: inspired by The Linux Cast and DistroTube.

A lot of cool stuff is inspired by [ACE] and flick0

Picom animations is inspired by Eden Lee and Zaney.

And some of my friends in the Virbox discord server also! [Virbox discord](https://discord.gg/a6kD6WT97p)
