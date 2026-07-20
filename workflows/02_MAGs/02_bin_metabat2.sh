#!/usr/bin/env bash
set -euo pipefail

# Portable workflow script. Review paths, database locations, resource requests,
# and compatible software versions before running on a local or Linux HPC system.

D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$D/config.sh"; mkdir -p "$BIN_DIR"
metabat2 --inFile "$CONTIGS" --abdFile "$DEPTH_DIR/contig_depth.txt" --outFile "$BIN_DIR/bin" --minContig "$MIN_CONTIG_LENGTH" --numThreads "$THREADS"
