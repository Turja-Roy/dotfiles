session_root "/home/turja/Turja-Roy/Research/CGM-Spectra-Analysis"

if initialize_session "CGM"; then

    load_window "codes"

	new_window "Terminal"
    run_cmd "source .venv/bin/activate"
	run_cmd "clear"
    
	new_window "Nav"
	run_cmd "y"

	# new_window "SSH"
	# run_cmd "clear"
	#
	# new_window "Nav-TACC"
	# run_cmd "clear"

	select_window 1
fi

finalize_and_go_to_session
