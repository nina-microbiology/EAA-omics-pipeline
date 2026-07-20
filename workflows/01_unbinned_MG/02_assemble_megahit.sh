#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$ASSEMBLY_DIR"
mapfile -t r1 < <(find "$TRIM_DIR" -maxdepth 1 -type f -name '*_val_1.fq.gz'|sort)
mapfile -t r2 < <(find "$TRIM_DIR" -maxdepth 1 -type f -name '*_val_2.fq.gz'|sort)
[[ ${#r1[@]} -gt 0 && ${#r1[@]} -eq ${#r2[@]} ]] || { echo 'Trimmed pairs missing or mismatched' >&2; exit 1; }
r1csv="$(IFS=,; echo "${r1[*]}")"; r2csv="$(IFS=,; echo "${r2[*]}")"
megahit -1 "$r1csv" -2 "$r2csv" --min-contig-len "$MIN_CONTIG_LENGTH" --num-cpu-threads "$THREADS" --out-dir "$ASSEMBLY_DIR"
