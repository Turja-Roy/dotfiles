session_root "/home/turja/Turja-Roy/Research/damsa-simulation"

if initialize_session "DAMSA"; then

    load_window "codes"

	new_window "Terminal"
	run_cmd "cd build && clear"
    split_h 50
    run_cmd "htop"
    select_pane 1
    
	new_window "Nav"
	run_cmd "y"

	select_window 1
fi

finalize_and_go_to_session
