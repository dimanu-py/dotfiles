# :box: Packages :box:

## How to generate packages files

To generate a file with all the packages install in your Arch system run

```bash
pacman -Qqe > pkglist.txt
```

The options do the followiing:

- `Q` lists all the packages
- `q` only shows the names of the packages
- `e` includes only the explicit installed packages, leaving out dependencies

## Install the packages

To install the packages in a new Arch system run

```bash
sudo pacman -S --needed - < pkglist.txt
```