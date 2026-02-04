#!/usr/bin/env bash
set -euo pipefail

BRANCH_NAME="$1"

if [[ -z "${BRANCH_NAME:-}" ]]; then
  echo "Usage: $0 <branch-name>"
  exit 1
fi

# Current worktree host
WT_ROOT="$(pwd)"
WT_BASENAME="$(basename "$WT_ROOT")"

if [[ "$WT_BASENAME" != *-wt ]]; then
  echo "Run this from <project>-wt"
  exit 1
fi

# Base project name without -wt
PROJECT="${WT_BASENAME%-wt}"
SRC_ROOT="../$PROJECT"

if [[ ! -d "$SRC_ROOT/.git" ]]; then
  echo "Source repo not found: $SRC_ROOT"
  exit 1
fi

# Folder name = project + branch with / replaced by -
SAFE_BRANCH="${BRANCH_NAME//\//-}"
WT_DIR="../$PROJECT-$SAFE_BRANCH"

# Ensure refs are up to date
git fetch --all --prune

# Add worktree
git worktree add -B "$BRANCH_NAME" "$WT_DIR"

# Enter worktree
cd "$WT_DIR"

# Copy env files
if [ -e "$SRC_ROOT/.env.worktree" ]; then
  cp -a "$SRC_ROOT/.env.worktree/." ./
  echo "env files copied"
fi

# Install dependencies
npm install
