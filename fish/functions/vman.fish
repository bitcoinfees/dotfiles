function vman -d 'View man page in vim' --wraps man
    vim -c "Man $argv" -c only
end
