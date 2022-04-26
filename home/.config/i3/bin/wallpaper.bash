file=`find ~/.wallpapers/ -type f -exec file {} \; | grep -o -P '^.+: \w+ image' | shuf -n 1 | sed "s|:.*||g"`

convert $file -quality 100 /tmp/actual_wallpaper.png

feh --recursive --bg-fill /tmp/actual_wallpaper.png
