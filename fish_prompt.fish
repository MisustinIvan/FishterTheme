function fish_prompt -d "Fishter custom prompt"

    # Keep the command executed status
    set --local last_status $status

    show_path
    show_status $last_status
end


function show_path -d "Prints current directory"

    set_color blue
    echo -en "["

#    set_color blue
#    echo -en $(whoami)@$(cat /etc/hostname) - 

    set_color blue
    echo -en (pwd | sed "s,^$HOME,~,")

    set_color blue
    echo -en "]"
end


function show_status -a last_status -d "Prints red/grey colon based on status"

    set --local current_color "FFF"

    if [ $last_status -ne 0 ]
        set current_color red
    end

    set_color $current_color
    echo -en "\$ "
    set_color normal
end
