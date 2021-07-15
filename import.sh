#!/usr/bin/env bash

set -euo pipefail

dbfile="${1:-}"
datfile="${2:-}"

if [[ -z "$1" || -z "$2" ]]; then
    echo "usage: $0 [dbfile] [datfile]" >&2
    exit 1
fi

if [[ ! -f "$dbfile" ]]; then
    echo "$dbfile missing; creating..."
    sqlite3 -init schema.sql "$dbfile" < /dev/null
fi

quirk='s/^//'
sepcount=$(head -n 1 "$datfile" | grep -o '|' | wc -l)
if [[ "$sepcount" > 25 ]]; then
    echo "Smells like a IBKR-style trailing '|' dat, adjusting on import..."
    quirk='s/\|[[:space:]]*$//'
fi

tmpfile=$(mktemp)
# should probably trap exit and rm tmpfile or something

sed -E 's,^T\|,,' < "$datfile" | sed -E "$quirk" > "$tmpfile"
sqlite3 -cmd ".import $tmpfile executions" "$dbfile" < /dev/null
rm -f "$tmpfile"
