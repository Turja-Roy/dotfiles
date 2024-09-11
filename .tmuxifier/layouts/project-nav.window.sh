new_window "Nav"

split_h 50

select_pane 1
run_cmd "tree src"

select_pane 2
run_cmd "ranger"

select_pane 1
