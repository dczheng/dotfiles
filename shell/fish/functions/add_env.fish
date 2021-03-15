function add_env
    set base $argv[1]

    if test -d $base/bin
        set -xg PATH $base/bin $PATH
    end

    if test -d $base/include
        set -xg C_INCLUDE_PATH $base/include $C_INCLUDE_PATH
        set -xg CPLUS_INCLUDE_PATH $base/include $CPLUS_INCLUDE_PATH
    end

    if test -d $base/lib
        set -xg LD_LIBRARY_PATH $base/lib $LD_LIBRARY_PATH
        set -xg LIBRARY_PATH $base/lib $LIBRARY_PATH
    end

    if test -d $base/lib64
        set -xg LD_LIBRARY_PATH $base/lib64 $LD_LIBRARY_PATH
        set -xg LIBRARY_PATH $base/lib64 $LIBRARY_PATH
    end

    if test -d $base/lib/pkgconfig
        set -xg PKG_CONFIG_PATH $base/lib/pkgconfig $PKG_CONFIG_PATH
    end

end

