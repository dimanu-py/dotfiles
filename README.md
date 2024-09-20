# :gear: Dotfiles :gear:

This guide of how to use Stow to track configuration file was extracted from _Dream of Autonomy_ video and Stow documentation. The links to both
resources can be found in the links bellow.

[![Original video](https://img.shields.io/badge/Original%20Video-red?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=y6XCebnB9gs&t=304s)
[![GNU Stow Docs](https://img.shields.io/badge/GNU%20Stow%20Docs-green?style=for-the-badge&logo=book&logoColor=white)](https://www.gnu.org/software/stow/manual/stow.html)

----

1. [Install GNU Stow](#installation)
2. [Keep track of your configuration](#how-to-use)
   1. [Folder structure](#first-steps)
   2. [Track single files](#single-files)
   3. [Track folders](#folders)
   4. [Pushing to remote repo](#remote-repo)
---

<a name=installation></a>
## Installing GNU Stow

> [!NOTE]
> GNU Stow is a symlink farm manager which takes distinct packages of software and/or data located in separated directories on the file system
> and makes them appear to be installed in the sample place through symlinks

Install _stow_ package
```bash
brew install stow
```

<a name=how-to-use></a>
## Keep track of your configuration

<a name=first-steps></a>
### Folder structure

We first have to create a folder in the home directory to store your configurations:
```bash
mkdir ~/dotfiles && cd dotfiles
```

> [!IMPORTANT]
> In order to stow to work we must set this directory in the same way our _.config_ folder is organized.

Then we can initialize a git repository inside this folder
```bash
git init .
```

The _.git_ directory will be ignored automatically by Stow. To see the default files that will be ignored
you can visit [this webpage](https://www.gnu.org/software/stow/manual/stow.html#Ignore-Lists).

If you want to ignore custom files, you can create a _.stow-local-ignore_ file. Doing this you will override the default ignore
file and would need to specify all files you want to ignore, even if they are specified in the default file.

<a name=single-files></a>
### Track single files

To keep track of a single file we need to copy that file from our _.config_ folder into the new _dotfiles_. For example:
```bash
cp ~/.zshrc . 
```

After copying the file we can delete it from the original folder or rename it to have it as a backup (`mv ~/.zshrc ~/.zshrc.bak`)

To let Stow create the symlink we just need to run the following command inside the _dotfiles_ directory:
```bash
stow .
```

> [!TIP]
> We can see if this has worked by listing the _.zshrc_ file in the $HOME directory and seeing that it has a symbolic link to our file
> in the _dotfiles_ directory

After verifying the changes work correctly, we can commit the files. Also, we can modify the symlinked file in our home directory
and the changes will be applied at the same time to the _dotfiles_ file.

<a name=folders></a>
### Track folders

To keep track of a folder we need to copy it following the same format of our _.config_ folder. If we want 
to copy the alacritty configuration we would run:

```bash
cd dotfiles
mkdir .config
cp -r ~/.config/alacritty/ .config
```

When copying folders we can encounter conflicts between the actual _.config_ file and the one we've copied 
inside _dotfiles_. 

> [!WARNING]
> If we try to run `stow .` and there are conflicts, Stow will warn us and abort the operation.

To solve this we can delete the existing directory or rename it as we did for the single file. However, the best
approach here is to run:

```bash
stow --adopt .
```

> [!WARNING]
> Before running this command we should commit our _dotfiles_ file as the --adopt option will
> override the _dotfiles_ version with the _.config_ version that is causing the conflict. By doing
> this, we can decide which option we want to keep with git later on.

<a name=remote-repo></a>
### Pushing to remote repository

To keep safe the repository you can create a remote repo in GitHub or other platform and push
your _dotfiles_ there by running:

```bash
git remote add origin <path_to_your_remote_repo>
git push origin main
```
