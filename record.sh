#!/usr/bin/env bash

record() {
  # Toggle on mic
  amixer set Capture toggle

  # Original command for my own screen: :0.0+1920,0 ensures only 2nd monitor is captured
  # -c:v sets codec, in this case, H.264; -qp 0 ensures lossless

  # ffmpeg -s 1920x1200 -f x11grab -r 30 -i :0.0+1920,0 -c:v h264 -qp 0 "$HOME/video_$(date '+%a__%b%d__%H_%M_%S').mkv" &

  # Generic command to record at your screen dimensions
  ffmpeg -s "$(xdpyinfo | awk '/dimensions/{print $2}')" -f x11grab -r 30 -i :0.0 -c:v h264 -qp 0 "$HOME/video_$(date '+%a__%b%d__%H_%M_%S').mkv" &
  echo $! > /tmp/recpid

  # Specify alsa device with hw:0 etc.
  # Filters audio noise with noise floor
  ffmpeg -f alsa -i default -af "afftdn=nf=-75" "$HOME/audio_$(date '+%a__%b%d__%H_%M_%S').wav" &
  echo $! > /tmp/audpid

  echo "  " > /tmp/recordingicon

  notify-send -i "/usr/share/icons/Faba/48x48/devices/video-display.svg" -t 5000 "Recording started & mic toggled"
  }

end() {
  kill -15 "$(cat /tmp/recpid)" "$(cat /tmp/audpid)" && rm -f /tmp/recpid /tmp/audpid

  amixer set Capture toggle

  echo "" > /tmp/recordingicon

  notify-send -t 5000 -i "/usr/share/icons/Faba/48x48/devices/video-display.svg" "Recording ended & mic toggled"
  }

# If the recording pid exists, end recording. If not, start recording
([[ -f /tmp/recpid ]] && end && exit 0) || record
