function vman -d 'View man page in vim'
    vim -c "Man $argv" -c only
end
