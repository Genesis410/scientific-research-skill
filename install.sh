#!/usr/bin/env bash
# Install scientific-research-skill ke skills dir Hermes/agent.
# Pakai: curl -fsSL https://raw.githubusercontent.com/Genesis410/scientific-research-skill/main/install.sh | bash
set -euo pipefail

REPO="Genesis410/scientific-research-skill"
SKILLS_DIR="${HERMES_SKILLS_DIR:-$HOME/.hermes/skills}"
DEST="$SKILLS_DIR/scientific-research-skill"

while [ $# -gt 0 ]; do
  case "$1" in
    --dir) SKILLS_DIR="$2"; DEST="$SKILLS_DIR/scientific-research-skill"; shift 2 ;;
    -h|--help)
      echo "Pakai: install.sh [--dir <skills-dir>]"
      echo "  --dir   direktori tujuan (default: \$HERMES_SKILLS_DIR atau ~/.hermes/skills)"
      exit 0 ;;
    *) echo "arg tidak dikenal: $1" >&2; exit 1 ;;
  esac
done

command -v git >/dev/null 2>&1 || { echo "butuh git" >&2; exit 1; }
mkdir -p "$SKILLS_DIR"

if [ -d "$DEST/.git" ]; then
  echo "sudah terpasang — update..."
  git -C "$DEST" pull --ff-only -q
else
  rm -rf "$DEST"
  git clone --depth 1 "https://github.com/$REPO.git" "$DEST" -q
fi

echo "terpasang: $DEST"
echo "pakai: sebut 'riset ilmiah' / panggil skill scientific-research di runtime agent kamu"
echo "catatan: butuh runtime dengan tool pencarian web + ekstraksi halaman (web_search/web_extract)"
