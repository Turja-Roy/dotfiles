#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal

# $HOME/.config/polybar/launch.sh --cuts &
$HOME/.config/polybar/turja/launch.sh &
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
compfy --daemon &
# picom --config $HOME/.config/bspwm/picom.conf &

#change your keyboard if you need it
#setxkbmap -layout be

#Some ways to set your wallpaper besides variety or nitrogen
#feh --bg-scale ~/.config/bspwm/wall.png &
#feh --bg-fill /usr/share/backgrounds/archlinux/arch-wallpaper.jpg &
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#wallpaper for other Arch based systems
#feh --bg-fill /usr/share/archlinux-tweak-tool/data/wallpaper/wallpaper.png &
#feh --randomize --bg-fill ~/Dropbox/Apps/Desktoppr/*

ibus-daemon -drxR

xsetroot -cursor_name left_ptr &

run variety &
run pamac-tray &
run nm-applet &
# vktablet &
# xdman &
qbittorrent &
numlockx on &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
copyq &
