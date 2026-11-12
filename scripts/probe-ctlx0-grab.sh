#!/usr/bin/env bash
# Capture undecoded bus traffic mentioning address 15 (CTLX0) / NETX3 for mapping work.
set -euo pipefail

SECONDS_WAIT="${1:-120}"
OUT="${2:-/tmp/ctlx0-grab-$(date -u +%Y%m%dT%H%M%SZ).txt}"

ebusctl grab stop 2>/dev/null || true
ebusctl grab
sleep "$SECONDS_WAIT"
ebusctl grab result all >"$OUT" 2>/dev/null || true
ebusctl grab stop 2>/dev/null || true

grep -aE '(^15|3115|1515|1015|/ 15 |ctlx0|CTLX)' "$OUT" >"${OUT%.txt}-filtered.txt" || true

echo "Wrote $OUT and ${OUT%.txt}-filtered.txt"
wc -l "${OUT%.txt}-filtered.txt" 2>/dev/null || true
