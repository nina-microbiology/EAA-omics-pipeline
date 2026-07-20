#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$CAMPER_DIR"; [[ -n "$CAMPER_CMD" ]] || exit 2
for f in "$GENE_DIR"/*.faa; do [[ -e "$f" ]] || continue; b="$(basename "$f" .faa)"; "$CAMPER_CMD" --input "$f" --output "$CAMPER_DIR/$b" --threads "$THREADS"; done
