#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; R="$(cd "$D/../.." && pwd)"; mkdir -p "$MERGE_DIR"; t=()
for f in "$DBCAN_TABLE" "$KOFAM_TABLE" "$DIAMOND_TABLE" "$CAMPER_TABLE"; do [[ -f "$f" ]] && t+=(--table "$f:GeneID"); done
python3 "$R/helpers/merge_tables.py" --tpm "$TPM_DIR/gene_tpm.tsv" --tpm-id GeneID "${t[@]}" --output "$MERGE_DIR/MAG_to_MT_annotations_and_tpm.tsv"
