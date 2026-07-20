#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$GENE_DIR"
for f in "$FILTERED_BIN_DIR"/*.fa; do [[ -e "$f" ]] || continue; b="$(basename "$f" .fa)"; pyrodigal -i "$f" -p meta -j "$THREADS" -a "$GENE_DIR/$b.faa" -d "$GENE_DIR/$b.ffn" -f gff -o "$GENE_DIR/$b.gff"; done
