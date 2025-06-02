#!/bin/bash
offline(){
 music_dir="$HOME/Music"
 select_music="$(ls "$music_dir" | grep ".mp3" | sort -u | dmenu -c -l 15 -g 1 -p ' Select  music')" && notify-send -i /usr/share/icons/Catppuccin-SE/symbolic/mimetypes/audio-x-generic-symbolic.svg "Now Playing" "$select_music" && st -n scratchpad -g 80x15 -e mpv --ao=pipewire --no-video "$music_dir/$select_music" > /dev/null 2>&1
}
vibeplay(){
bam=$(bash onsong.sh)
$bam
}
bob(){
func=$(bash bob-dylan-songs.sh)
$func
}
while getopts 'obs' choice; do
case "$choice" in
o)
offline
;;
s)
vibeplay
;;
b)
bob
;;
 *)
               exit 1
               ;;
esac
done


