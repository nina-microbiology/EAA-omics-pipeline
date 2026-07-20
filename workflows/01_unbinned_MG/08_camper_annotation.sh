#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$CAMPER_DIR"
[[ -n "$CAMPER_CMD" ]] || { echo 'Set CAMPER_CMD in config.sh for your installed CAMPer release.' >&2; exit 2; }
"$CAMPER_CMD" --input "$PROTEIN_FASTA" --output "$CAMPER_DIR" --threads "$THREADS"
