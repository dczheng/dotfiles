function add_env
    set base $argv[1]

    if test -d $base/bin
        set -xg PATH $base/bin $PATH
    end

    if test -d $base/include
        set -xga C_INCLUDE_PATH $base/include
        set -xga CPLUS_INCLUDE_PATH $base/include
    end

    if test -d $base/lib
        set -xga LD_LIBRARY_PATH $base/lib
        set -xga LIBRARY_PATH $base/lib
    end

    if test -d $base/lib64
        set -xga LD_LIBRARY_PATH $base/lib64
        set -xga LIBRARY_PATH $base/lib64
    end

    if test -d $base/lib/pkgconfig
        set -xga PKG_CONFIG_PATH $base/lib/pkgconfig
    end

end

