## i3

### Installation

Seems like ubuntu repository holds old version of i3 (4.17 whereas i3 documentation mentions 4.21), probably a good idea to add their repository.

https://i3wm.org/docs/repositories.html

#### List of stuff to install

* feh (wallpaper)
* ffmpeg (screen recording)
* xkbset (mouse-keys)
* picom (compositor)

### i3 configuration

Located inside `~/.i3/config.d/` folder (files ending with `.conf` extension). The last line at `~/.i3/config` includes those configuration files.

### Policy Kit

You need to install one of the polkits to have an authentication agent.

https://wiki.archlinux.org/title/Polkit

In this case install `policykit-1-gnome`, as agent from this package will be launched by `polkit.conf` configuration file.

### Brightness

Install `brightnessctl` to make bindings in `brigthness.conf` file working.

https://unix.stackexchange.com/a/726779

### Touchpad extra gestures

https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/

```
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
	Identifier "touchpad"
	MatchIsTouchpad "on"
	Driver "libinput"
	Option "Tapping" "on"
	Option "TappingButtonMap" "lrm"
	Option "NaturalScrolling" "on"
	Option "ScrollMethod" "twofinger"
EndSection
EOF
```

### Wallpapers

Add wallpapers to `~/Wallpapers`. They will be randomly selected with `feh`.

## Picom

Copy config to `~/.config/picom.conf`.

## Kitty

Install from https://sw.kovidgoyal.net/kitty/binary/

Copy config to `~/.config/kitty`.

This config relies on `FiraCode Nerd Font Mono` font, so it needs to be installed from https://www.nerdfonts.com/font-downloads.

## Oh-My-Zsh

TODO

## bin/

Contains some helpful scripts, like ffmpeg screen recording or controling Spotify.

