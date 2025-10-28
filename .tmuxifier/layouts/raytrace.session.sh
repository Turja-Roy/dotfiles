session_root "/home/turja/UTA/Fall25/UROP/raytrace-xe-flashlamp-fiber"

if initialize_session "Raytrace"; then

	new_window "Codes"
	run_cmd "clear"
	run_cmd "nv"

	new_window "Terminal"
	run_cmd "clear"
    
	new_window "Nav"
	run_cmd "y"

	new_window "SSH"
	run_cmd "clear"

	select_window 1

fi

finalize_and_go_to_session
