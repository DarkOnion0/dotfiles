file=`find ~/.wallpapers/ -type f -exec file {} \; | grep -o -P '^.+: \w+ image' | shuf -n 1 | sed "s|:.*||g"`

feh --recursive --bg-fill $file

convert $file -quality 10 -blur "5x4" /tmp/actual_wallpaper.png
