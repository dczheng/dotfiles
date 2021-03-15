function fish_prompt
    #set prompt_dir (pwd)
    set prompt_dir (string split / (pwd))
    set_color green 
    set h (cat /etc/hostname)
    set d $prompt_dir[-1]
    if [ $d = "" ]
        set d "/"
    end

    set_color green
    echo -en "$USER"
    echo -en "@"
    echo -en "$h"
    set_color yellow
    echo -en ".$d > "

    set color normal
end
