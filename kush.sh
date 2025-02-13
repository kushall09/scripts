{
	used=$(printf "%s\n" "Shuffle Wallpaper" "Take ScreenShots" "Web Search" "Play Some Music" "Cancel"| dmenu -c -g 1 -l 5)
	if [ "$used" = "Shuffle Wallpaper" ]; then
		access.sh -w
	elif [ "$used" = "Web Search" ]; then
		access.sh -d
	elif [ "$used" = "Play Some Music" ]; then
	        musicopts
	elif [ "$used" = "Take ScreenShots" ]; then
	        shootkush.sh	
	elif [ "$used" = "Cancel" ]; then
	        return		
	fi
}	
