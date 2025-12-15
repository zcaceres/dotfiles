#!/bin/bash
# Evening Planning Launcher for Claude Code
# Runs headless prep work, then opens Ghostty with interactive session

# Set PATH for launchd environment (claude via bun, node via volta)
export PATH="$HOME/.bun/bin:$HOME/.volta/bin:$PATH"

VAULT_DIR="$HOME/obsidian-vault-zach-person"
GHOSTTY="/Applications/Ghostty.app/Contents/MacOS/ghostty"
SESSION_FILE="/tmp/claude-evening-session-id"
LOG_FILE="/tmp/claude-evening-prep.log"

cd "$VAULT_DIR"

# Notify that prep is starting
osascript -e 'display notification "Processing your day..." with title "Claude Code" sound name "Glass"'

# Run headless prep work - review the day and prepare summary
claude -p "Run the daily-planning skill in evening/processing mode. Review what was planned vs accomplished today, check completed tasks, and prepare a summary of the day with any items to carry forward. Present the summary and wait for my feedback." \
  --output-format json \
  --permission-mode acceptEdits \
  --allowedTools "Read,Write,Bash,Skill,Glob,Grep" \
  > "$LOG_FILE" 2>&1

# Extract session ID from JSON output
SESSION_ID=$(cat "$LOG_FILE" | jq -r '.session_id // empty' 2>/dev/null)

if [ -n "$SESSION_ID" ]; then
  echo "$SESSION_ID" > "$SESSION_FILE"

  # Notify ready
  osascript -e 'display notification "Day summary ready! Review and wrap up." with title "Claude Code" sound name "Glass"'

  # Open Ghostty and resume the session
  "$GHOSTTY" -e bash -c "cd '$VAULT_DIR' && claude --resume '$SESSION_ID'"
else
  # Fallback: prep failed, just open fresh session
  osascript -e 'display notification "Prep failed - opening fresh session" with title "Claude Code" sound name "Basso"'
  "$GHOSTTY" -e bash -c "cd '$VAULT_DIR' && claude"
fi
