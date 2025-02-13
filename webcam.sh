#!/bin/sh

chown root:video /dev/video0
chmod g+rwx /dev/video0
st -n webcam -g 40x15 -e mpv --title="Webcam" av://v4l2:/dev/video0 > /dev/null 

