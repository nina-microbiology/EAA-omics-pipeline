#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; export GTDBTK_DATA_PATH; mkdir -p "$GTDBTK_DIR"
gtdbtk classify_wf --genome_dir "$FILTERED_BIN_DIR" --out_dir "$GTDBTK_DIR" --extension fa --cpus "$THREADS"
