# Install Guide

Since this installation and configuration is meant to be as automated as possible, this file is meant to walk through what happens in the installation step by step to organize, document, and share this installation!

In all honesty automating the installation and configuration of a system is what brought me to arch more than anything. 

Since this is to 'build a car' rather than just parts or looks of it, we will take a layered approach to the installation where we have a main script that executes the various install .sh scripts in a manner to resolve dependencies and as they may be installed manually.

# Desktop Environment

You'll probably want a desktop environment to actually do some work, so let's build one! I enjoy hyprland so far as it forces my desktop to be cleaner rather than the jumbled mess I usually find myself in haha.

ulauncher -> applauncher
notification daemon -> dunst
wallpaper -> awww
file manager -> ranger
pipewire
status bar / shell -> waybar
clipboard -> wl-copy
terminal -> kitty
authentication agent -> ????

# Dotfiles

Now this is the last section. We have all our base tools installed so we populate the configurations! We'll want to first clear any out if they happen to exist, and then we create symlinks to the locations from the dotfiles folder here! This makes it so that changes we make will appear in both spots, so they are active in the system and being tracked by git.

===== Walkthrough of dotfiles and their major points of change =====
.gitconfig
.bashrc
.vimrc
fastfetch/
waybar/
hypr/
