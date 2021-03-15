function zopen
    set pdf_opener  zathura
    set txt_opener  gedit
    set img_opener  feh

    set filetype (string split "." -- $argv[1])[-1]
    echo "Open" $argv[1]
    switch $filetype

        case "pdf" "djvu"
            $pdf_opener  $argv[1] &

        case "txt" "tex" "bib"
            $txt_opener  $argv[1] &

        case "png" "jpg" "jpeg" "bmp"
            $img_opener  $argv[1] &

        case '*'
            printf "Can't open `%s`\n" $argv[1]
    end
end

