function fish_right_prompt
	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

    echo -n -s (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) ' ' \
        "$USER" @ "$__fish_prompt_hostname" 
end
