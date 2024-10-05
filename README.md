# :gear: Dotfiles :gear:

Here you can find all my window manager configs as well as different programms I use with Arch.

Most of the programs are compatible with other Linux distributions.

----
1. [How to manage configuration files](#dotfiles)
   1. [Install GNU Stow](#installation)
   2. [Use these configs](#how-to-use)
2. [System utilities](#programs)
---

<a name=dotfiles></a>
## How to manage these configuration files

To manage all the config files I use stow. I will explain how to manage the files once you have all the file structure like in this repository.

You can find a complete guide in _Dream of Autonomy_ YT Channel and Stow documentation. The links to both resources can be found in bellow.

[![Original video](https://img.shields.io/badge/Original%20Video-red?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=y6XCebnB9gs&t=304s)
[![GNU Stow Docs](https://img.shields.io/badge/GNU%20Stow%20Docs-green?style=for-the-badge&logo=book&logoColor=white)](https://www.gnu.org/software/stow/manual/stow.html)


<a name=installation></a>
### Installing GNU Stow

> [!NOTE]
> GNU Stow is a symlink farm manager which takes distinct packages of software and/or data located in separated directories on the file system
> and makes them appear to be installed in the sample place through symlinks

Install _stow_ package

```bash
sudo pacman -S stow
```

<a name=how-to-use></a>
### Use these configs

> [!IMPORTANT]
> THe most important thing when working with stow is to have a folder in your home directory that is organised in the same way as the folders you want to trakc.

First thing you'll need to do is clone this repository in your home directory.

```bash
cd
git clone git@github.com:dimanu-py/dotfiles.git
```

With the current folder structure, you can select which packages you want to use. For example, if you only want to apply my [fish](./fish/.config/fish/) and [i3](./i3/.config/i3/) configurations, you would run:

```bash
stow fish
stow i3
```

> [!NOTE]
> These commands will create a symlink with the same structure of the package in your .config folder.

<a name=programs></a>
## System utilities

These section will cover all software packages that I've install. Well, maybe not all of them, but the most importants ones.

### Wallpaper

To set and modify the wallpaper I use [feh](https://wiki.archlinux.org/title/Feh) and [nitrogen](https://wiki.archlinux.org/title/Nitrogen)

To install these packages run:

```bash
sudo pacman -S feh
```

To set the wallpaper execute

```bash
feh --bg-scale path/to/wallpaper
```

Personally, I normally download this [GitHub repository](https://github.com/antoniosarosi/Wallpapers).

### Fonts

For installing fonts I usually go to [Nerd Fonts](https://www.nerdfonts.com/) and download the ones I like. My favourite ones however are already downloaded and saved in this repo under `local/.local/share/fonts`

To list all available fonts you can run

```bashh
fc-list
```

### Audio

For audio I use [pipewire](https://wiki.archlinux.org/title/PipeWire). I recommend installing a graphical program such as [pavucontrol](https://archlinux.org/packages/extra/x86_64/pavucontrol/) if you prefer to do this kind of things with a GUI instead of shortcuts or terminal commands.

```bash
sudo pacman -S pipewire pavucontrol
```

To manager volumen control easily latter on with shortcuts I recommend installing [pamixer](https://archlinux.org/packages/extra/x86_64/pamixer/) too.

>[!IMPORTANT]
> My window manager configs have keybindings with pamixer, if you don't install it you would need to change it.

### Monitors

In my case, the monitor setup is a bit special because I use a docking station with Display Manager drivers. Under the [monitor](./monitors/.config/monitors/) package you can have more detailed information on how to setup everything and why the need of it. In summary:

- Run the `driver_installation.sh` script
- Run the `setup.sh` script
- Add this last script to your Xprofile file or create a service to run it on boot

You don't need to run this if it's not your case. What I mainly use to set the monitors is [xrandr](https://wiki.archlinux.org/title/Xrandr)

<a name=storage></a>
### Storage

To be able to use external hard drives or USBs you would need to install [udiskie](https://github.com/coldfix/udiskie). If you want to read write NTFS formatted drives you would need [ntfs-3g](https://wiki.archlinux.org/title/NTFS-3G) too.

```bash
sudo pacman -S udiskie ntfs-3g
```
<a name=network></a>
### Network

You can configure your network connection with [nmcli](https://man.archlinux.org/man/nmcli.1.en). With this utility you can search for your wifi with

```bash
ncmli device wifi list
```

and connect running

```bash
nmcli device wifi connect network-name password network-password
```

However, I prefer to use a graphical tool such as [Network Manager](https://wiki.archlinux.org/title/NetworkManager)

```bash
sudo pacman -S network-manager-applet
```

### Systray

When you install the packages for [network](#network) and [storage](#storage) you'll be able to launch the programs and see icons to click and configure drives and network.

```bash
udisikie -t &
nm-applet &
```

If you want, you can install tray icons for volume and battery:

```bash
sudo pacman -S volumeicon cbatticon
```

Then run them with

```bash
volumeicon &
cbatticon &
```

### Menu

To execute programs easily I install [rofi](https://wiki.archlinux.org/title/Rofi)

```bash
sudo pacman -S rofi
```

You can downloads all the themes by running

```bash
git clone https://github.com/davatorium/rofi-themes
cd rofi-themes
./install.sh
```

However, I have by default the [onedrak](./local/.local/share/rofi/themes/) theme download in my configs so it gets applied automatically when I sincronizee my configs.

### Terminal

For my terminal emulator I use [wezterm](https://wezfurlong.org/wezterm/index.html) and my bash profile is [fish](https://fishshell.com/)

```bash
sudo pacman -S wezterm fish
```

All the configurations can be reviewed in their corresponding packages, [wezterm](./wezterm/.config/wezterm/) and [fish](./fish/.config/fish/)

### Git

I have a specific package to store my personal preferences when using git and a bunch of aliases when I use the terminal. All the explanation can be found in the README file inside [gitconfig](./gitconfig/) package.

