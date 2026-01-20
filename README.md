# Crop Failure in Sub-Saharan Africa  
**Evidence, Measurement, and Spatial Prediction**

This repository serves as a **living research workspace** for building a systematic, reproducible evidence base on **crop failure among smallholder farmers in Sub-Saharan Africa (SSA)**. The project combines household survey data, spatial prediction methods, and satellite-derived indicators to better understand **where, why, and for whom crop failure occurs**, and how it varies across space, time, and management conditions.

At this stage, the repository primarily defines the **analytical structure, data architecture, and reproducibility framework**. Code modules are being added incrementally as analyses progress and are validated.

---

## Scope and objectives

The repository is designed to support three tightly linked strands of analysis:

1. **Survey-based measurement of crop failure**
   - Construction of crop failure indicators from household survey data (e.g., harvested vs planted area).
   - Sensitivity to alternative definitions, severity thresholds, and shock attribution.
   - Descriptive and econometric analysis of prevalence and drivers of crop failure.

2. **Spatial prediction from survey microdata**
   - Linking plot-level crop failure outcomes to spatial covariates (climate, soils, market access).
   - Generating gridded predictions of crop failure risk and severity.
   - Explicit treatment of spatial heterogeneity and uncertainty.

3. **Satellite-based crop failure detection**
   - Use of vegetation indices, seasonal performance metrics, and climate anomalies.
   - Identification of crop stress and failure signatures from remote sensing.
   - Comparison and triangulation with survey-based measures.

An additional objective is to **reconcile and validate crop failure signals across data sources**, enabling more robust regional assessments and policy-relevant targeting.

---

## Current status

- ✅ Repository structure, configuration system, and documentation framework are in place  
- ✅ One completed survey-based report (December 2025) archived in `reports/pdf/`  
- 🚧 Core R and Stata code modules are under active development  
- 🚧 Spatial prediction and satellite workflows are being implemented incrementally  

This repository should be viewed as **work in progress**, with code, documentation, and outputs evolving alongside the research.

---

## Repository organization (overview)

- `docs/`  
  Conceptual documentation, methodological notes, and public-facing explanations.

- `reports/`  
  Final PDF reports cleared for public sharing, with citations and reproducibility notes.

- `config/`  
  Centralized configuration files (paths, countries, crops, definitions, model options).

- `R/`  
  Reusable R functions (package-style) for data processing, spatial modeling, satellite features, and visualization.  
  *(Functions will be added progressively.)*

- `stata/`  
  Stata do-files for econometric analysis (e.g., fractional response models, Mundlak–Chamberlain specifications).  
  *(Scripts will be added and refined as models stabilize.)*

- `pipelines/`  
  High-level scripts orchestrating end-to-end workflows (survey → models → spatial prediction → reports).

- `analysis/`  
  Quarto / R Markdown sources for reports, tables, and figures.

- `data/`  
  Placeholder structure for raw, intermediate, and processed data.  
  **Restricted survey microdata are not included in this repository.**

- `outputs/`  
  Generated tables, figures, and maps, separated into public and private outputs.

---

## Data access and restrictions

This repository does **not** contain raw household survey microdata (e.g., LSMS-ISA, RALS).  
Users must obtain data directly from the original providers and place them locally following the paths defined in `config/config.yml`.

All scripts are written to respect data access constraints and to ensure that only **aggregated, non-disclosive outputs** are exported to public folders.

---

## Reproducibility philosophy

The project follows a **structure-first, code-second** approach:

- Folder structure, configuration, and reporting pipelines are defined upfront.
- Code modules are added only once logic is clear, documented, and tested.
- Each public report is accompanied by:
  - a clear citation,
  - a configuration snapshot,
  - and a reproducibility trail (pipelines used).


---

## Reports

A list of public reports, including citation details and links, is maintained in:`reports/pdf/README.md`


---

## Citation

If you use this repository or its outputs, please cite the relevant report(s) listed in the reports catalog.  
A software citation file is provided in `CITATION.cff`.

---

## Disclaimer

This repository contains research code and documentation under active development.  
Analyses, methods, and results may change as work progresses.  
Views expressed in reports or derived outputs do not necessarily reflect the positions of CIMMYT, CGIAR, or funding partners.

---

## Contact

For questions, collaboration, or data access guidance, please contact the repository maintainers or open an issue.
