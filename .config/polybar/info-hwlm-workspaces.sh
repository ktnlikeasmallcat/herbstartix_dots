#!/usr/bin/env bash


#[module/info-hlwm-workspaces]
#type = custom/script
#exec = ~/.config/polybar/info-hlwm-workspaces.sh
#exec-if = ps -C herbstluftwm >/dev/null 2>&1
#tail = true
#scroll-up = herbstclient use_index -1 --skip-visible &
#scroll-down = herbstclient use_index +1 --skip-visible &
#label-active-font=1
#


herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status)"
        {
            for i in "${tags[@]}" ; do
                # Read the prefix from each tag and render them according to that prefix
                case ${i:0:1} in
                    '#')
                        # the tag is viewed on the focused monitor
                        # TODO Add your formatting tags for focused workspaces
                        echo "%{F#000}%{B#F27127}%{U#F28D35}" # Add your formatting tags for empty workspaces
                        ;;
                    ':')
                        # : the tag is not empty
                        # TODO Add your formatting tags for occupied workspaces
                        echo "%{F#000}%{B#BFB8AA}" # Add your formatting tags for empty workspaces
                        ;;
                    '!')
                        # ! the tag contains an urgent window
                        # TODO Add your formatting tags for workspaces with the urgent hint
                        ;;
                    '-')
                        # - the tag is viewed on a monitor that is not focused
                        # TODO Add your formatting tags for visible but not focused workspaces
                        echo "%{F-}%{B#764E29}" # Add your formatting tags for empty workspaces
                        ;;
                    *)
                        # . the tag is empty
                        # There are also other possible prefixes but they won't appear here
                        echo "%{F-}%{B-}" # Add your formatting tags for empty workspaces
                        ;;
                esac

                echo "%{A1:herbstclient use ${i:1}:}  ${i:1}  %{A -u -o F- B-}"
            done

            echo "%{F-}%{B-}"
        } | tr -d "\n"

    echo

    # wait for next event from herbstclient --idle
    read -r || break
done
} 2>/dev/null
