#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"
python3 "$D/04_filter_bins.py" --checkm "$CHECKM_DIR/checkm_summary.tsv" --bins "$BIN_DIR" --output "$FILTERED_BIN_DIR" --min-completeness "$MIN_COMPLETENESS" --max-contamination "$MAX_CONTAMINATION"
