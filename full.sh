#!/bin/bash
while true; do
	active_wid=$(xprop -root _NET_ACTIVE_WINDOW)
	active_wid="${active_wid#*\# }"
	active_wid="${active_wid%,*}" # Necessary for XFCE
	while [ ${#active_wid} -lt 10 ]; do
		active_wid="0x0${active_wid#*x}"
	done
	response=$(xprop -id "$active_wid" | grep "_NET_WM_STATE_FULLSCREEN")
	if [ -n "$response" ]; then
	fullscreen_state=true
	else
	fullscreen_state=false
	fi

	if [ "$fullscreen_state" = "true" ]; then
		polybar-msg cmd hide
	else
		polybar-msg cmd show
	fi
done
