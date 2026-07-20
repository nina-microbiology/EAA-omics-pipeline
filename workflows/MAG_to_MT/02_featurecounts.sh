#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$COUNT_DIR"; mapfile -t b < <(find "$MAP_DIR" -name '*.sorted.bam'|sort)
featureCounts -T "$THREADS" -p -t CDS -g ID -a "$REF_DIR/all_MAGs.gff" -o "$COUNT_DIR/featurecounts.tsv" "${b[@]}"
