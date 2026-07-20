# EAA Omics Workflow Scripts

Portable, text-only workflow scripts organized into four analysis sets:

1. `workflows/unbinned_MG/`
2. `workflows/MAGs/`
3. `workflows/MG_to_MT/`
4. `workflows/MAG_to_MT/`

The scripts were reconstructed from the documented dissertation workflow and prior workflow organization. They are cleaned for public sharing: no UF account numbers, usernames, personal absolute paths, sample identifiers, raw data, or figures are included.

## Before running

1. Copy each `config.example.sh` to `config.sh`.
2. Edit input, output, database, and software paths.
3. Confirm installed software versions are mutually compatible.
4. Run scripts in numerical order.
5. On SLURM systems, run inside an allocation or add site-specific `#SBATCH` headers.

Validate on a small test dataset before applying to full datasets.
