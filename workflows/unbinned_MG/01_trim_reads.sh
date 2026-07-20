#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$TRIM_DIR"
while IFS=$'\t' read -r r1 r2; do
  [[ -z "$r1" || "$r1" == \#* ]] && continue
  sample="$(basename "$r1")"; sample="${sample%%_R1*}"; sample="${sample%%_1.*}"
  trim_galore --paired --cores "$THREADS" --basename "$sample" --output_dir "$TRIM_DIR" "$r1" "$r2"
done < "$MG_SAMPLE_SHEET"
