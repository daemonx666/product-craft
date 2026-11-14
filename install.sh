#!/usr/bin/env bash
# Symlink every skill under skills/ into the personal skill folders of
# Claude Code (~/.claude/skills) and Codex (~/.agents/skills).
# Symlinks mean edits and `git pull` take effect without reinstalling.
set -euo pipefail

repo="$(cd "$(dirname "$0")" && pwd)"
targets=("$HOME/.claude/skills" "$HOME/.agents/skills")

for skill in "$repo"/skills/*/; do
  name="$(basename "$skill")"
  for dir in "${targets[@]}"; do
    mkdir -p "$dir"
    link="$dir/$name"
    if [ -e "$link" ] && [ ! -L "$link" ]; then
      echo "skip $link: a non-symlink folder with this name already exists"
      continue
    fi
    ln -sfn "${skill%/}" "$link"
    echo "linked $link -> ${skill%/}"
  done
done
