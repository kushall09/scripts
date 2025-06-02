#!/bin/sh
# source
#SRC="https://vid.puffyan.us"
#SRC="https://yewtu.be"

SONGNAME=$(echo '' | dmenu -l 0 -g 0 -c -p "Search: ")

if [ -n "$SONGNAME" ]; then

SRC="https://inv.nadeko.net"
# make youtube search query
query="$(printf '%s' "$SONGNAME" | tr ' ' '+' )"

# search on invidous (youtube) instance for video id to make a url
video_id="$(curl -s "$SRC/search?q=$query" | grep -Eo "watch\?v=.{11}" | head -n 1)"
youtube_url="https://youtube.com/$video_id"
#notify about the selection
title=$(yt-dlp --get-title "$youtube_url")
notify-send -i /usr/share/icons/Catppuccin-SE/symbolic/mimetypes/audio-x-generic-symbolic.svg "Playing: " "$title"

# get url for bestaudio stream from the youtube video
audio_url="$(yt-dlp -f bestaudio --get-url "$youtube_url")"


#mpv $audio_url
st -n scratchpad -g 80x15 -e mpv --no-video $audio_url  > /dev/null 2>&1

fi
