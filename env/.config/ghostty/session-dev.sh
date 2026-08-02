#!/bin/bash
SESSION="dev"

TOOLKIT_DIR="$HOME/Documents/Working Directory/Repos/toolkit"
MIGRATION_DIR="$HOME/Documents/Working Directory/Repos/migration-plt-to-group-akeneo"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
  # Tab 1: toolkit
  tmux new-session -d -s "$SESSION" -n toolkit -c "$TOOLKIT_DIR"
  tmux split-window -h -t "${SESSION}:toolkit" -c "$TOOLKIT_DIR"
  tmux send-keys -t "${SESSION}:toolkit.2" "npm run dev" C-m

  # Tab 2: migration-plt-to-group-akeneo
  tmux new-window -t "$SESSION" -n migration -c "$MIGRATION_DIR"
  tmux split-window -h -t "${SESSION}:migration" -c "$MIGRATION_DIR"
  tmux send-keys -t "${SESSION}:migration.2" "npm run dev" C-m

  tmux select-window -t "${SESSION}:toolkit"
  tmux select-pane -t "${SESSION}:toolkit.1"
fi

tmux attach-session -t "$SESSION"
