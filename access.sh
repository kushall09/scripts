
wall(){
img=/home/kushal/.wallpaper/nord
image=$(ls $img | grep -E '(jpg|png)$' | sort -R | tail -1)
set_wp=$(feh --bg-scale $img/$image)
$set_wp
notify-send "Set $image as Wallpaper" -i /usr/share/icons/Catppuccin-SE/24x24/categories/xviewer.svg -t 3000
}

dmenu_web(){
    URL='https://duckduckgo.com/?q='
    QUERY=$(echo '' | dmenu -l 1 -g 0 -c -p "Web Search: ")
    if [ -n "$QUERY" ]; then
   # xdg-open "${URL}${QUERY}" 2> /dev/null
   firefox "${URL}${QUERY}" 2> /dev/null
fi
}
while getopts 'wd' choice; do
case "$choice" in 
w)
wall
;;
d)
dmenu_web
;;
 *)
	       exit 1
	       ;;
esac
done

