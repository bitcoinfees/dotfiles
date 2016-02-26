function fish_mode_prompt --description 'Displays the current mode'
	# Do nothing if not in vi mode
  if set -q __fish_vi_mode
    switch $fish_bind_mode
      case default
        echo '|'
      case insert
        echo '>'
      case visual
        set_color --bold magenta
        echo '|'
    end
  end
end
