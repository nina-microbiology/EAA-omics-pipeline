#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; R="$(cd "$D/../.." && pwd)"; mkdir -p "$TPM_DIR"
python3 "$R/helpers/counts_to_tpm.py" --counts "$COUNT_DIR/featurecounts.tsv" --output "$TPM_DIR/gene_tpm.tsv"
