#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$CHECKM_DIR"
checkm lineage_wf --extension fa --threads "$THREADS" --pplacer_threads "$THREADS" --tab_table --file "$CHECKM_DIR/checkm_summary.tsv" "$BIN_DIR" "$CHECKM_DIR/lineage_wf"
