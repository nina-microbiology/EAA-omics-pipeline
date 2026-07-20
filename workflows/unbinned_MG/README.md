# Unbinned Metagenome Workflow

Run in order: trimming, MEGAHIT assembly, Pyrodigal gene prediction, dbCAN, KofamScan, DIAMOND, MG read mapping, and optional CAMPer annotation.

Copy `config.example.sh` to `config.sh` first. For plot/season coassemblies, create one sample sheet per intended coassembly group and run separately.
