#!/bin/bash

input=$(cat)
cwd=$(echo "$input" | jq -r '.cwd')
project=$(basename "$cwd")
notification_type=$(echo "$input" | jq -r '.notification_type')

BUNDLE_ID="org.alacritty"

send_notification() {
  local message="$1"
  local sound="$2"

  if [[ -n "${BUNDLE_ID}" ]]; then
    terminal-notifier -title "Claude Code" -subtitle "${project}" -message "${message}" -sound "${sound}" -activate "${BUNDLE_ID}"
  else
    terminal-notifier -title "Claude Code" -subtitle "${project}" -message "${message}" -sound "${sound}"
  fi
}

case "${notification_type}" in
  "permission_prompt")
    send_notification "許可待ち" "Ping"
    ;;
  "idle_prompt")
    send_notification "入力待ち" "Purr"
    ;;
  "stop")
    send_notification "タスク完了" "Glass"
    ;;
  *)
    send_notification "通知" ""
    ;;
esac

