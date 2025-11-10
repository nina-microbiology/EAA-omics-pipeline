# EAA-Omics-Pipeline
UF dissertation project integrating metagenomic, metatranscriptomic, and CAZyme functional analyses of Everglades Agricultural Area (EAA) soils using dbCAN3, KofamScan, CAMPer, and custom multi-omics visualization workflows.

---

## Author
**Nina Charissa Aguilar Infantado**  
Ph.D. Candidate, University of Florida (UF IFAS SWFREC / FLREC)  
ORCID: [0009-0008-0947-0611](https://orcid.org/0009-0008-0947-0611)  
Email: ninfantado@ufl.edu  

Advised by Dr. Sarah Strauss and Dr. Willm Martens-Habbena.

---

## Contents
This repository includes workflow scripts for:

1. **Unbinned Metagenomes (MG)** – trimming, assembly, annotation, and CAZyme prediction  
2. **Metagenome-Assembled Genomes (MAGs)** – binning, QC, functional annotation, and abundance  
3. **Metatranscriptomes (MT)** – mapping, expression quantification, and visualization  
4. **Integration** – linking MG / MAG / MT results and producing custom CAZyme heatmaps and pathway figures  

---

## Repository Structure
```text
workflows/
├── unbinned_MG/
├── MAGs/
├── MG_to_MT/
└── MAG_to_MT/
example_output/
```



---

## Tools & Frameworks
dbCAN3 • KofamScan • Pyrodigal • CAMPer • GTDB-Tk • CheckM • SAMtools • Bowtie2 • BWA-MEM • MetaBAT2 • MEGAHIT • DIAMOND • featureCounts • Trim Galore! • BBTools • Python • R

---

## License
Released under the [MIT License](LICENSE).

---

## Citation
If you use or adapt these scripts, please cite:
> Infantado, N.C.A. (2025). *EAA-omics-pipeline: multi-omics workflows for Everglades Agricultural Area soils.* GitHub repository, [https://github.com/nina-microbiology/EAA-omics-pipeline](https://github.com/nina-microbiology/EAA-omics-pipeline)

---

## Acknowledgments
Developed as part of the University of Florida IFAS Department of Microbiology and Cell Science (SWFREC / FLREC).
Supported by Dr. Sarah Strauss and Dr. Willm Martens-Habbena.
Field sampling and access to Everglades Agricultural Area (EAA) sites were made possible through the support of the UF IFAS Everglades Research and Education Center (EREC).
The metagenomic and metatranscriptomic datasets analyzed in this repository were originally collected from Everglades Agricultural Area (EAA) soils in 2017 and sequenced by the DOE Joint Genome Institute (JGI-IMG) under studies published by Huang et al. (2021) and Zhao et al. (2023).
Computational resources were provided by the University of Florida Research Computing Center (HiPerGator) with technical support from Grant Godden.
This work was funded by the USDA National Institute of Food and Agriculture (NIFA) Agriculture and Food Research Initiative (AFRI) under award #2022-67019-36501.
Some workflows and scripts were derived and customized from dbCAN3 and other open-source tools referenced below.

---

## Workflow Tools Referenced

This repository integrates customized HiPerGator workflows used for the analysis of metagenomes (MG), metatranscriptomes (MT), and metagenome-assembled genomes (MAGs) from Everglades Agricultural Area (EAA) soils.  
The workflows include:  
- **Unbinned MG workflows** — assembly, annotation, and functional profiling  
- **MAG workflows** — binning, quality control, and genome-resolved annotation  
- **Unbinned MG → MT mapping** — transcript mapping and expression quantification  
- **MAG → MT mapping** — genome-resolved expression and synteny visualization  

---

### Assembly, Mapping, Binning, and Quality Control
- **MEGAHIT** — de novo metagenome assembly (Li et al., 2015)  
- **BWA-MEM** — short-read alignment to unbinned contigs (Li & Durbin, 2009)  
- **Bowtie2** — read alignment to MAGs and MT datasets (Langmead & Salzberg, 2012)  
- **SAMtools** — BAM sorting, indexing, and coverage processing (Li et al., 2009)  
- **MetaBAT2** — genome binning based on coverage and composition (Kang et al., 2019)  
- **CheckM** — MAG completeness and contamination assessment (Parks et al., 2015)  
- **GTDB-Tk v2 (R214)** — standardized taxonomic classification of MAGs (Chaumeil et al., 2022)  

---

### Functional and Taxonomic Annotation
- **dbCAN3 / CAZy** — CAZyme family, subfamily (eCAMI), substrate (dbCAN-sub), and gene cluster (PULDB) annotation  
  (Zheng et al., 2023; Lombard et al., 2013)  
- **Pyrodigal v2.0.1** — gene prediction for unbinned contigs and MAGs (Larralde, 2022)  
- **KofamScan / KofamKOALA** — KEGG Ortholog assignment for carbon and energy metabolism (Aramaki et al., 2020; Kanehisa & Goto, 2000)  
- **DIAMOND v2.1.8** — fast protein alignment against SwissProt and NCBI NR databases (Buchfink et al., 2015)  
- **CAMPer** — curated database for polyphenol and aromatic compound metabolism (McGivern et al., 2024)  

---

### Pre- and Post-Processing
- **RQCFilter2 / BBTools v38.49** — JGI read filtering and contaminant removal (Bushnell et al., 2017)  
- **BBMerge** — read merging and format handling (Bushnell et al., 2017)  
- **Trim Galore! v0.6.0** — adapter and quality trimming (Krueger et al., 2021; uses Cutadapt)  
- **featureCounts v2.0.3** — read-to-gene quantification (Liao et al., 2014)  

---

### Phylogeny and Alignment Visualization
- **MAFFT v7.520** — multiple sequence alignment (Katoh & Standley, 2013)  
- **TrimAl v1.4.1** — automated alignment trimming (Capella-Gutiérrez et al., 2009)  
- **FastTree v2.1.11** — maximum-likelihood tree inference (Price et al., 2010)  
- **iTOL / ggtree** — tree visualization and annotation  

---

### Databases and Reference Resources
- **CAZy / dbCAN** — HMM profiles, eCAMI subfamilies, dbCAN-sub substrates, and PULDB cluster definitions  
- **KEGG Orthology (KO)** — metabolic pathway and enzyme reference profiles  
- **SwissProt** and **NCBI NR** — curated protein reference databases for DIAMOND searches  
- **GTDB (R214)** — reference taxonomy database for MAG classification  
- **CAMPer** — curated polyphenol and aromatic compound metabolism modules  

---

### Computing and Visualization Environment
All computational analyses were executed on the [University of Florida HiPerGator](https://www.rc.ufl.edu/) high-performance computing cluster using the SLURM workload manager.  
Statistical summaries and figure rendering were conducted locally using:  
- **Python 3.8** — data integration and heatmap/synteny visualization (`pandas`, `numpy`, `matplotlib`, `seaborn`, `scipy`, `Biopython`)  
- **R v4.3.1** — statistical summaries and figure rendering (`ggplot2`, `ggtree`, `ape`, `dplyr`, `tidyr`)  

---

> **Note:** Only workflows up to the functional annotation and mapping steps are shared in this repository for reproducibility.  
> Data visualization scripts (R and Python) are available upon request to protect unpublished figure designs used in dissertation chapters.


