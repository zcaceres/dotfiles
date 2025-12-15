#!/bin/bash
# Morning Planning Launcher for Claude Code
# Runs headless prep work, then opens Ghostty with interactive session

# Set PATH for launchd environment (claude via bun, node via volta)
export PATH="$HOME/.bun/bin:$HOME/.volta/bin:$PATH"

VAULT_DIR="$HOME/obsidian-vault-zach-person"
GHOSTTY="/Applications/Ghostty.app/Contents/MacOS/ghostty"
SESSION_FILE="/tmp/claude-morning-session-id"
LOG_FILE="/tmp/claude-morning-prep.log"

cd "$VAULT_DIR"

# Notify that prep is starting
osascript -e 'display notification "Preparing your daily plan..." with title "Claude Code" sound name "Glass"'

# Run headless prep work - fetch calendar, tasks, and draft a plan
claude -p "Run the daily-planning skill in morning mode. Fetch my calendar and tasks, review my NOW.md, and prepare a draft daily plan. Present the draft plan and wait for my feedback." \
  --output-format json \
  --permission-mode acceptEdits \
  --allowedTools "Read,Write,Bash,Skill,Glob,Grep" \
  > "$LOG_FILE" 2>&1

# Extract session ID from JSON output
SESSION_ID=$(cat "$LOG_FILE" | jq -r '.session_id // empty' 2>/dev/null)

if [ -n "$SESSION_ID" ]; then
  echo "$SESSION_ID" > "$SESSION_FILE"

  # Notify ready
  osascript -e 'display notification "Daily plan ready! Review and adjust." with title "Claude Code" sound name "Glass"'

  # Open Ghostty and resume the session
  "$GHOSTTY" -e bash -c "cd '$VAULT_DIR' && claude --resume '$SESSION_ID'"
else
  # Fallback: prep failed, just open fresh session
  osascript -e 'display notification "Prep failed - opening fresh session" with title "Claude Code" sound name "Basso"'
  "$GHOSTTY" -e bash -c "cd '$VAULT_DIR' && claude"
fi
