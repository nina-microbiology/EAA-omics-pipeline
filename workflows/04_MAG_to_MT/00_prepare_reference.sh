#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$REF_DIR"; cat "$MAG_FASTA_DIR"/*.fa > "$REF_DIR/all_MAGs.fa"; cat "$MAG_GFF_DIR"/*.gff > "$REF_DIR/all_MAGs.gff"; bowtie2-build "$REF_DIR/all_MAGs.fa" "$REF_DIR/all_MAGs"
