#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$KOFAM_DIR"
exec_annotation --profile="$KOFAM_PROFILES" --ko-list="$KOFAM_KO_LIST" --cpu="$THREADS" --format=detail-tsv --output="$KOFAM_DIR/kofam_detail.tsv" "$PROTEIN_FASTA"
