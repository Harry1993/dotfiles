# Environment setup

Given a fresh Debian/Ubuntu...

## utilities

```
apt install dnsutils resolvconf
apt install alsa-utils pulseaudio-utils pulseaudio
apt install openssh ufw sshfs
apt install iftop htop
apt install unrar unzip
```

Go [here](https://www.google.com/get/noto/) to download some `Google Noto
fonts`. Then follow [this](https://gist.github.com/rogerleite/99819) to install
them. For Arch Linux: the pacakge names are `noto-fonts`, `noto-fonts-cjk` and
`noto-fonts-emoji`.

~~Go [here](https://www.dropbox.com/install-linux) to install `Dropbox`.~~
Screw Dropbox, use `rclone`:

```
> rclone sync --exclude-from ~/Dropbox/.rcloneignore -P --dry-run ~/Dropbox dropbox:/
```

## bases

```
apt install python3 python3-pip ipython3
apt install chromium-browser git wget
apt install scrot imagemagick
```

## apps

* window manager: `i3`
* status bar: ~~`polybar` or~~`i3pystatus`
* terminal emulator: `rxvt-unicode-256color`
* terminal multiplexer: `tmux`
* text editor: `vim`
* shell: `oh-my-zsh`: follow
  [this](https://gist.github.com/tsabat/1498393#file-zsh-md)
* emailing: `mutt`
* pdf viewer: `zathura`
* network monitor: `iftop`
* process monitor: `htop`
* remap-keys: `xmodmap`
* media player: `mpv`
* music player: `cmus`
* downloader: `aria2`
* IRC client: `irssi`

## btw

[This](http://tutos.readthedocs.io/en/latest/source/Arch.html) is a nice
tutorial for a fresh Arch Linux.
