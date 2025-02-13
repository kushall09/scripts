{
	selected=$(printf "%s\n" "Cancel" "Poweroff" "Reboot" "Logout" "Suspend"| dmenu -c -g 1 -l 5)
	if [ "$selected" =  "Poweroff" ]; then
		systemctl poweroff 
	elif [ "$selected" = "Reboot" ]; then
                systemctl reboot
        elif [ "$selected" = "Logout" ]; then
                killall dwm
        elif [ "$selected" = "Cancel" ]; then
 		return
        elif [ "$selected" = "Suspend" ]; then
	        systemctl suspend 
        fi
}
