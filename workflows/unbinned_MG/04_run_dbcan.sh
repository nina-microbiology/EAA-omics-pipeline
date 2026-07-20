#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$DBCAN_DIR"
echo 'Review dbCAN command options for your installed release before running.'
"$DBCAN_CMD" "$PROTEIN_FASTA" protein --out_dir "$DBCAN_DIR" --dia_cpu "$THREADS" --hmm_cpu "$THREADS" --dbcan_thread "$THREADS"
