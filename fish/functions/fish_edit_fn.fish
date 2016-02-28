function fish_edit_fn --description 'Edit a fish fn.'
    set name $argv[1]
    if [ -z $name ]
        echo "No function name specified!"
        return 1
    end

    set funcfile $FISH_HOME/functions/$name.fish
    if [ ! -e $funcfile ]
        echo function $name\nend >> $funcfile
    end
    eval $EDITOR $funcfile

    # FIXME: This doesn't work!
    # Remove file if it's empty
    # if [ (count (xargs < $funcfile)) -eq 0 ]
    #     rm $funcfile
    # end
end
