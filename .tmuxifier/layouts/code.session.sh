session_root "$(pwd)"

if initialize_session $(basename $(pwd)); then

	new_window "Coding"
	if [[ -d "$(pwd)/src" ]]; then
		run_cmd "cd $(pwd)/src"
	else
		run_cmd "cd $(pwd)"
	fi
	run_cmd "clear"
	run_cmd "nv"

	new_window "Nav"
	run_cmd "cd $(pwd)"
	run_cmd "clear"
	run_cmd "ranger"

	select_window 1

fi

finalize_and_go_to_session
