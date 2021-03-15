function bat
    for k in $(upower -e)
        echo $k
        upower -i $k
    end
end
