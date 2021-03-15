function bl 
    set XX ( cat /sys/class/backlight/intel_backlight/max_brightness )
    if test -z $argv[1]
        set X $XX
    else
        set X $argv[1]
    end
    echo $X"/"$XX
    echo $X | sudo tee /sys/class/backlight/intel_backlight/brightness > /dev/null
end
