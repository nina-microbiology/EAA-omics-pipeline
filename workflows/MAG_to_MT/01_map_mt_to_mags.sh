#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$MAP_DIR"
while IFS=$'\t' read -r r1 r2; do [[ -z "$r1" || "$r1" == \#* ]] && continue; s="$(basename "$r1")"; s="${s%%_R1*}"; s="${s%%_1.*}"; bowtie2 -x "$REF_DIR/all_MAGs" -1 "$r1" -2 "$r2" -p "$THREADS" | samtools sort -@ "$THREADS" -o "$MAP_DIR/$s.sorted.bam" -; samtools index "$MAP_DIR/$s.sorted.bam"; done < "$MT_SAMPLE_SHEET"
