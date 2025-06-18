#!/usr/bin/bash
rssfeed="https://feeds.bbci.co.uk/news/world/rss.xml"
title=$(curl -s "$rssfeed" | xmlstarlet sel -t -m "//item[position() <= 5]" -v "title" -n)
links=$(curl -s "$rssfeed" | xmlstarlet sel -t -m "//item[position() <= 5]" -v "link" -n)
declare -a titles
declare -a linkies
dext=0
linex=0
while IFS= read -r linest; do
  if [ -n "$linest" ]; then
    titles[$dext]="$linest"
    ((dext++))
  fi
done <<< "$title"
while IFS= read -r linkest; do
  if [ -n "$linkest" ]; then
    linkies[$linex]="$linkest"
    ((linex++))
  fi
done <<< "$links"

echo "1.${titles[0]}"
echo "2.${titles[1]}"
echo "3.${titles[2]}"
echo "4.${titles[3]}"
echo "5.${titles[4]}"

echo "======================="
echo "Select a number to read"
read ch

case $ch in
  1)
    yad --html --browser --uri=${linkies[0]} --width=650 --height=480
    ;;
  2)
    yad --html --browser --uri=${linkies[1]} --width=650 --height=480
    ;;
  3)
    yad --html --browser --uri=${linkies[2]} --width=650 --height=480
    ;;
  4)
    yad --html --browser --uri=${linkies[3]} --width=650 --height=480
    ;;
  5)
    yad --html --browser --uri=${linkies[4]} --width=650 --height=480
    ;;
  *)
    echo "Invalid Option"
    ;;
esac
