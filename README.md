# :gear: Dotfiles :gear:

Here you can find all my window manager configs as well as different programms I use with Arch.

Most of the programs are compatible with other Linux distributions.

----
1. [How to manage configuration files](#dotfiles)
   1. [Install GNU Stow](#installation)
   2. [Use these configs](#how-to-use)
2. [Basic system utilities](#programs)
   1. [Wallpaper](#wallpaper)
   2. [Fonts](#fonts)
   3. [Audio](#audio)
   4. [Monitors](#monitors)
   5. [Storage](#storage)
   6. [Network](#network)
   7. [Systray](#systray)
   8. [Menu](#menu)
   11. [Notifications](#notifications)
3. [More advanced system utilities](#advanced)
   1. [Terminal](#terminal)
   2. [Git](#git)
   3. [i3 Window Manager](#i3)
   4. [AUR Helper](#yay)
   5. [Media Transfer Protocol](#mtp)
   6. [File Manager](#file-manager)
   7. [Trash](#trash)
   7. [Multimedia](#multimedia)
   8. [Bluetooth](#bluetooth)
4. [Xprofile](#xprofile)
---

<a name=dotfiles></a>
## How to manage these configuration files

To manage all the config files I use stow. I will explain how to manage the files when you have all the file structure like in this repository.

You can find a complete guide in _Dream of Autonomy_ YT Channel and Stow documentation. The links to both resources can be found bellow.

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
> The most important thing when working with stow is to have a folder in your home directory that is organised in the same way as the folders you want to track.

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
## Basic system utilities

This section will cover all software packages that I've install. Well, maybe not all of them, but the most importants ones.

If you only want to install them and use them directly with stow, run the following:

```bash
cd dotfiles
stow packages
cd
sudo pacman -S --needed - < pkglist.txt
```

<a name=wallpaper></a>
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

Personally, I normally download this [GitHub repository](https://github.com/antoniosarosi/Wallpapers) for my wallpapers.

<a name=fonts></a>
### Fonts

For installing fonts I usually go to [Nerd Fonts](https://www.nerdfonts.com/) and download the ones I like. My favourite ones however are already downloaded and saved in this repo under the [fonts](./local/.local/share/fonts/) package.

To list all available fonts you can run

```bashh
fc-list
```

<a name=audio></a>
### Audio

For audio I use [pipewire](https://wiki.archlinux.org/title/PipeWire). I recommend installing a graphical program such as [pavucontrol](https://archlinux.org/packages/extra/x86_64/pavucontrol/) if you prefer to do this kind of things with a GUI instead of shortcuts or terminal commands.

```bash
sudo pacman -S pipewire pavucontrol
```

To manage volumen control easily latter on with shortcuts I recommend installing [pamixer](https://archlinux.org/packages/extra/x86_64/pamixer/) too.

>[!IMPORTANT]
> My window manager configs have keybindings with pamixer, if you don't install it you would need to change it.

<a name=monitors></a>
### Monitors

In my case, the monitor setup is a bit special because I use a docking station with Display Manager drivers. Under the [monitor](./monitors/.config/monitors/) package you can have more detailed information on how to setup everything and why the need of it. In summary:

You don't need to follow these instructions if it's not your case. What I mainly use to set the monitors is [xrandr](https://wiki.archlinux.org/title/Xrandr)

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

<a name=systray></a>
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

<a name=menu></a>
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

<a name=notifications></a>
### Notifications

To have desktop notifications I use [libnotify](https://archlinux.org/packages/extra/x86_64/libnotify/) and [notification-daemon](https://archlinux.org/packages/extra/x86_64/notification-daemon/)

```bash
sudo pacman -S libnotify notification-daemon
```

For tilling window managers you need to create a service to get notifications:

```bash
sudo nano /usr/share/dbus-1/services/org.freedesktop.Notifications.service
```

Paste these lines

```bash
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon-1.0/notification-daemon
```

Test it like so:

```bash
notify-send "Hello World"
```

<a name=advanced></a>
## More advanced system utilities

<a name=terminal></a>
### Terminal

For my terminal emulator I use [wezterm](https://wezfurlong.org/wezterm/index.html) and my bash profile is [fish](https://fishshell.com/)

```bash
sudo pacman -S wezterm fish
```

All the configurations can be reviewed in their corresponding packages, [wezterm](./wezterm/.config/wezterm/) and [fish](./fish/.config/fish/)

<a name=git></a>
### Git

I have a specific package to store my personal preferences when using git and a bunch of aliases when I use the terminal. All the explanation can be found in the README file inside [gitconfig](./gitconfig/) package.

<a name=i3></a>
### i3 Window Manager

My favourite window manager is [i3](https://i3wm.org/). To install it and its configuration files run:

```bash
sudo pacman -S i3
stow i3
```

You would want to install i3blocks, i3status and i3lock to have more control over your desktop enviroment.

```bash
sudo pacman -S i3blocks i3status i3lock
```

My configuration files for i3 are in the [i3](./i3/.config/i3/) package. They are separated in 7 files:

- **appearance.conf**: To configure anything related to the appearance of the window manager. Things like wallpaper, fonts, gaps, etc.
- **autostart**: To execute programs on startup
- **bar**: To configure the bar at the bottom of the screen. An alternative I use is [polybar](https://polybar.github.io/) which configuration files can be found in the [polybar](./polybar/.config/polybar/) package. Both bars are configured in a similar way, but I like more polybar.
- **binding_modes.conf**: To configure the binding modes of the window manager.
- **floating_windows**: To configure specific windows that should be open as a floating window.
- **keybindings.conf**: To configure the keybindings of the window manager.
- **workspaces.conf**: To configure the workspaces of the window manager.
- **config**: The main configuration file. It only includes all the other files.
- **config.bak**: A backup of the default config file.

Under the [scripts](./i3/.config/i3/scripts/) folder you can find a script to lock your screen with i3lock and another script to logout, switch user, reboot, etc. Inside them
you can find where you should copy this files in order to make them work. Remember to give execution permissions with

```bash
chmod +x path/to/script
```

<a name=yay></a>
### AUR Helper

To install additional software from the Arch User Repository (AUR) you can use an AUR helper. I use [yay](https://github.com/Jguer/yay).

First, install base-devel and git:

```bash
sudo pacman -S base-devel git
```   

Now, clone the repository and install it with makepkg:

```bash
cd /opt/
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R username:username yay-git/
cd yay-git
makepkg -si
```

Now you can install software using yay. For example, to install neovim from the AUR, you would run:

```bash
yay -S neovim-nightly
```

<a name=mtp></a>
### Media Transfer Protocol

If you want to connect your phone to your computer using a USB port, you'll need MTP implementation and some CLI to use it, like this one:

```bash
sudo pacman -S libmtp
yay -S simple-mtpfs
```

To list connected devices:

```bash
simple-mtpfs -l
```

To mount the first device in the previous list:

```bash
simple-mtpfs --device 1 /mount/point
```

<a name=file-manager></a>
### File Manager

For a graphical file manager my favourite is [pcmanfm](https://archlinux.org/packages/extra/x86_64/pcmanfm/) but you can install [thunar](https://archlinux.org/packages/extra/x86_64/thunar/) if you prefer.

```bash
sudo pacman -S pcmanfm thunar
```

For a terminal based file manager I recommend [ranger](https://archlinux.org/packages/extra/x86_64/ranger/). Although it's very vim-like, you can use it if you know how to move in vim.

```bash
sudo pacman -S ranger
```

<a name=trash></a>
### Trash

We need a trash system to avoid losing files by accident. For a CLI trash system you can use [gvfs](https://archlinux.org/packages/extra/x86_64/gvfs/) and [glib2](https://archlinux.org/packages/extra/x86_64/glib2/).

```bash
sudo pacman -S glib2 gvfs
```

To trash a file you can use:

```bash
gio trash path/to/file
```

To empty the trash you can use:

```bash
gio trash --empty
```

With pcmanfm you can open the trash clicking on the left panel, but on the command line you can use:

```bash
ls ~/.local/share/Trash/files
```

To empty the trash you can use:

```bash
gio trash --empty
```
<a name=multimedia></a>
### Multimedia

> [!NOTE]
> If you want to look for different tools you can visit this [page](https://wiki.archlinux.org/title/List_of_applications/Multimedia).
> For specific screenshot tools I search on this other [page](https://wiki.archlinux.org/title/Screen_capture) and watch some YT videos.

To make screenshots I use [flameshot](https://github.com/flameshot-org/flameshot?tab=readme-ov-file#installation).

To install it you can use pacman:

```bash
sudo pacman -S flameshot
```

For image previews, one of the best that I could find is [geeqie](https://archlinux.org/packages/extra/x86_64/geeqie/).

```bash
sudo pacman -S geeqie
```

To play videos and music I use [vlc](https://archlinux.org/packages/extra/x86_64/vlc/).

```bash
sudo pacman -S vlc
```

<a name=bluetooth></a>
### Bluetooth

To connect to bluetooth devices I use [bluez](https://archlinux.org/packages/extra/x86_64/bluez/) and [blueman](https://archlinux.org/packages/extra/x86_64/blueman/).

```bash
sudo pacman -S bluez blueman
```

To enable and start the bluetooth service run:

```bash
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```

With this you can run the blueman gui to pair devices and more.

<a name=xprofile></a>
## Xprofile

Most of the applications for systray are not launch automatically. If we want to lunch some program before the window manager starts, we need to add
the command to a xprofile file.

First, we need to install xinit:

```bash
sudo pacman -S xorg-xinit
```

Now you can use ~/.xprofile to run programs before your window manager starts:

```bash
touch ~/.xprofile
```

For example, if you place this in ~.xprofile:

```bash
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --output HDMI-1 --mode 1920x1080 --pos 0x0 &
nm-applet &
udiskie -t &
volumeicon &
cbatticon &
```

Every time you login you will have all systray utilities and monitors set.

> [!NOTE]
> Mine xprofile is all commented because I want to manage this programs inside the window manager.

