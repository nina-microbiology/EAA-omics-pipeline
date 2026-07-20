#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

tools=(trim_galore megahit pyrodigal bwa bowtie2 bowtie2-build samtools jgi_summarize_bam_contig_depths metabat2 checkm gtdbtk exec_annotation diamond featureCounts python3)
missing=0
for tool in "${tools[@]}"; do
  if command -v "$tool" >/dev/null 2>&1; then printf 'FOUND   %s
' "$tool"; else printf 'MISSING %s
' "$tool"; missing=1; fi
done
echo 'dbCAN and CAMPer commands vary by installed release; check each workflow config and official documentation.'
exit "$missing"
