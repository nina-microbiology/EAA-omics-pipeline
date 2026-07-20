#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$DEPTH_DIR"
mapfile -t bams < <(find "$BAM_DIR" -maxdepth 1 -type f -name '*.bam'|sort); [[ ${#bams[@]} -gt 0 ]] || exit 1
jgi_summarize_bam_contig_depths --outputDepth "$DEPTH_DIR/contig_depth.txt" "${bams[@]}"
