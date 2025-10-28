# Defined in fish_greeting.fish @ line 1
function fish_greeting
    if status is-login
        clear 
        set sys (cat /etc/hostname)
        cowsay.sh "$USER (*.*) Welcome to $sys (*.*)"
        #echo ">>>>>>>>>>>>>>>>>>>"
        #echo ">>>>>>>>>>>>>>>>>>>"
        #echo "Last Login:"
        #lastlog | sed -n '3,$p' | egrep -v "(Never| tty)" | awk '{print $1" from "$3}'
        #echo ">>>>>>>>>>>>>>>>>>>"
        #date
    end
end
