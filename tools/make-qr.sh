#!/usr/bin/env bash
# Regenerate every QR code in the decks. Needs qrencode (brew install qrencode).
# Run from anywhere; paths are resolved against the repository root.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BASE="https://www.indos-costaction.eu/wg3-ts2026-esteban"

command -v qrencode >/dev/null || { echo "qrencode not found (brew install qrencode)" >&2; exit 1; }

# One QR per deck, pointing at the published deck.
for deck in "$ROOT"/day*-*/; do
  name="$(basename "$deck")"
  qrencode -t SVG -o "$deck/images/qr-talk-url.svg" "$BASE/$name/"
done

# Guest Wi-Fi at the venue (CSIC Espacio Converge).
qrencode -t SVG -o "$ROOT/day1-01-welcome/images/qr-wifi.svg" \
  'WIFI:T:WPA;S:eventos-csic;P:2Jqv590CGfwp;;'

# The Federated Journal Club.
qrencode -t SVG -o "$ROOT/day1-01-welcome/images/qr-journal-club.svg" \
  'https://www.indos-costaction.eu/journal-club/'

# The school's programme page.
qrencode -t SVG -o "$ROOT/day1-01-welcome/images/qr-training.svg" \
  'https://www.indos-costaction.eu/training'

echo "QR codes regenerated under $BASE"
