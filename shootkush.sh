{
        opt=$(printf "%s\n" "Whole Window" "Selective Screenshot" "Cancel"| dmenu -c -g 1 -l 3)
          if [ "$opt" = "Whole Window" ]; then
                scrsh -a
        elif [ "$opt" = "Selective Screenshot" ]; then
                scrsh -b
        elif [ "$opt" = "Cancel" ]; then
                return
        fi
}


