#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$DBCAN_DIR"
for f in "$GENE_DIR"/*.faa; do [[ -e "$f" ]] || continue; b="$(basename "$f" .faa)"; "$DBCAN_CMD" "$f" protein --out_dir "$DBCAN_DIR/$b" --dia_cpu "$THREADS" --hmm_cpu "$THREADS" --dbcan_thread "$THREADS"; done
