session_root "~/Turja-Roy/Programming/Java_Projects/Chain-Reaction-GOT"

if initialize_session "CR-GOT"; then

  new_window "Editor"
  run_cmd "cd src && clear"
  run_cmd "nv"

  load_window "project-nav"

  select_window 1

fi

finalize_and_go_to_session
