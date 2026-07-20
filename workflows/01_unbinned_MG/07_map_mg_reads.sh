#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$MAP_DIR"; bwa index "$ASSEMBLY_FASTA"
while IFS=$'\t' read -r r1 r2; do
  [[ -z "$r1" || "$r1" == \#* ]] && continue
  sample="$(basename "$r1")"; sample="${sample%%_R1*}"; sample="${sample%%_1.*}"
  bwa mem -t "$THREADS" "$ASSEMBLY_FASTA" "$r1" "$r2" | samtools sort -@ "$THREADS" -o "$MAP_DIR/${sample}.sorted.bam" -
  samtools index "$MAP_DIR/${sample}.sorted.bam"
done < "$MG_SAMPLE_SHEET"
