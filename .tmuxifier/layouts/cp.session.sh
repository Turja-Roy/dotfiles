session_root "/home/turja/Turja-Roy/Programming"

if initialize_session "cp"; then

  new_window "LeetCode"
  run_cmd "cd /home/turja/Turja-Roy/Programming/LeetCode"
  run_cmd "clear"
  run_cmd "nv"
  new_window "Codeforces"
  run_cmd "cd /home/turja/Turja-Roy/Programming/Codeforces"
  run_cmd "clear"
  run_cmd "nv"

  select_window 1

fi

finalize_and_go_to_session
