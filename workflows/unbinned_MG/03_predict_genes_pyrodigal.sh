#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$GENE_DIR"
pyrodigal -i "$ASSEMBLY_FASTA" -p meta -j "$THREADS" -a "$PROTEIN_FASTA" -d "$GENE_NT_FASTA" -f gff -o "$GENE_GFF"
