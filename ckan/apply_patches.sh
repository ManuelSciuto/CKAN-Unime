#!/bin/bash

set -e

for d in /app/patches/*; do
  if [ -d "$d" ]; then
    for f in "$d"/*.patch; do
      echo "Applying patch $f in $(basename "$d")"
      cd "/usr/lib/ckan/$(basename "$d")"
      patch -p1 < "$f"
    done
  fi
done

exec ckan run
