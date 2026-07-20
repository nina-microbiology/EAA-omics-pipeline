#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$DIAMOND_DIR"
for f in "$GENE_DIR"/*.faa; do [[ -e "$f" ]] || continue; b="$(basename "$f" .faa)"; diamond blastp --query "$f" --db "$SWISSPROT_DB" --out "$DIAMOND_DIR/$b.swissprot.tsv" --outfmt 6 qseqid sseqid pident length evalue bitscore stitle --max-target-seqs 1 --evalue 1e-5 --threads "$THREADS"; done
