#!/bin/bash
#import /tmp/clscn.png
scrot -s /tmp/clscn.png
out=$( curl -F'file=@/tmp/clscn.png' -Fexpires=1 https://0x0.st | tail -n 1)
#srout="https://lens.google.com/uploadbyurl?url=$out"
srout="https://yandex.com/images/search?source=collections&rpt=imageview&url=$out"

echo $srout
yad --html --browser --uri=$srout --width=700 --height=400
