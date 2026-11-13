#!/usr/bin/env bash
# Mass-read ebusd entities for a circuit; emit CSV for config cleanup.
set -euo pipefail

CIRCUIT="${1:-bai}"
TIMEOUT="${EBUS_READ_TIMEOUT:-4}"
OUT="${2:-}"

if [[ -z "$OUT" ]]; then
  OUT="validation/${CIRCUIT}-reads-$(date -u +%Y%m%dT%H%M%SZ).csv"
fi
mkdir -p "$(dirname "$OUT")"

echo "circuit,entity,status,detail" >"$OUT"

# Write-only / passive entities that cannot be read from the bus.
SKIP_ENTITIES='Clearerrorhistory SetMode StatusCirPump'

mapfile -t ENTITIES < <(
  ebusctl find -a 2>/dev/null |
    sed -n "s/^${CIRCUIT} \\([^=]*\\) =.*/\\1/p" |
    sed 's/^[[:space:]]*//;s/[[:space:]]*$//' |
    sort -u |
    while read -r ent; do
      skip=0
      for s in $SKIP_ENTITIES; do
        [[ "$ent" == "$s" ]] && skip=1 && break
      done
      [[ $skip -eq 0 ]] && echo "$ent"
    done
)

dup_report="$(ebusctl find -a 2>/dev/null | sed -n "s/^${CIRCUIT} \\([^=]*\\) =.*/\\1/p" | sort | uniq -d | tr '\n' ';')"

for ent in "${ENTITIES[@]}"; do
  [[ -z "$ent" ]] && continue
  raw="$(timeout "$TIMEOUT" ebusctl read -c "$CIRCUIT" -m 0 "$ent" 2>&1)" || true
  status="ok"
  detail="${raw//$'\n'/ }"
  if [[ "$detail" == ERR:* ]]; then
    status="err"
  elif [[ "$detail" == *"no data stored"* ]]; then
    status="nodata"
  elif [[ "$detail" == *"cutoff"* ]] || [[ "$detail" == *"nosignal"* ]]; then
    status="degraded"
  fi
  detail="${detail//\"/\"\"}"
  echo "${CIRCUIT},\"${ent}\",${status},\"${detail}\"" >>"$OUT"
done

{
  echo ""
  echo "# duplicates (same entity name listed twice in find -a): ${dup_report:-none}"
} >>"$OUT"

echo "Wrote $OUT (${#ENTITIES[@]} unique entities)"
