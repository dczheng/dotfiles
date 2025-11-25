# Defined in fish_greeting.fish @ line 1
function fish_greeting
    if status is-login
        cowsay.sh "Welcome to $(cat /etc/hostname)"
    end
end
