session_root "/home/turja/Turja-Roy/Research/CGM-Spectra-Analysis"

if initialize_session "CGM"; then

    load_window "codes"

	new_window "Terminal"
    run_cmd "source .venv/bin/activate"
	run_cmd "clear"
    split_h 50
    select_pane 1
    split_v 50
    select_pane 1
    
	new_window "Nav"
	run_cmd "y"

	select_window 1
fi

finalize_and_go_to_session
