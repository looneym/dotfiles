session=intercom
window=${session}:1
pane=${window}.3
send-keys -t "$pane"  'rspec `pbpaste`' Enter
select-pane -t "$pane"
select-window -t "$window"
attach-session -t "$session"

