#!/usr/bin/env bash
set -euo pipefail

# Create directories
mkdir -p \
  .github/workflows \
  docs/methodology \
  docs/reports \
  reports/pdf \
  reports/briefs \
  reports/figures \
  config \
  renv \
  R \
  pipelines \
  stata/do \
  stata/ado \
  stata/logs \
  analysis/paper_survey_report/figs \
  analysis/paper_survey_report/tables \
  data/raw \
  data/interim \
  data/processed \
  data/metadata/checksums \
  outputs/public/figures \
  outputs/public/tables \
  outputs/public/maps \
  outputs/public/logs \
  outputs/private \
  tests/testthat

# Create README.md
[ -f README.md ] || cat > README.md <<'EOF'
# Crop Failure SSA

This repository contains the analytical framework for assessing crop failure in Sub-Saharan Africa (SSA).
It integrates household survey data with spatial prediction modeling and satellite imagery analysis.
The workflow utilizes both R and Stata for econometric analysis, feature engineering, and predictive modeling.
Key components include survey sampling weights, spatial covariate selection, and fusion validation of failure definitions.
Structure includes pipelines for data processing, Stata estimation, and R-based spatial predictions.
EOF

# Create .gitignore
[ -f .gitignore ] || cat > .gitignore <<'EOF'
data/raw
data/interim
outputs/private
stata/logs
*.dta
*.tif
*.gpkg
*.env
*_key.json
renv/library
EOF

# Create CITATION.cff
[ -f CITATION.cff ] || cat > CITATION.cff <<'EOF'
cff-version: 1.2.0
title: "Crop Failure SSA"
authors:
  - family-names: "Doe"
    given-names: "Jane"
version: 0.1.0
EOF

# Create CHANGELOG.md
[ -f CHANGELOG.md ] || touch CHANGELOG.md

# Create Makefile
[ -f Makefile ] || cat > Makefile <<'EOF'
.PHONY: setup survey stata spatial_survey sat_features sat_models fusion report all

all: setup survey stata spatial_survey sat_features sat_models fusion report

setup:
	@echo "Setting up project dependencies..."

survey:
	@echo "Processing survey outcomes..."

stata:
	@echo "Running Stata econometric models..."

spatial_survey:
	@echo "Running spatial prediction models for survey data..."

sat_features:
	@echo "Building satellite imagery features..."

sat_models:
	@echo "Running satellite-based failure models..."

fusion:
	@echo "Validating fusion of survey and satellite data..."

report:
	@echo "Rendering final reports..."
EOF

# Create config/config.yml
[ -f config/config.yml ] || cat > config/config.yml <<'EOF'
paths:
survey:
econometrics:
spatial_prediction_survey:
satellite:
fusion:
render:
EOF

# Create .github/workflows/ci.yml
[ -f .github/workflows/ci.yml ] || cat > .github/workflows/ci.yml <<'EOF'
name: CI
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
EOF

# List of empty files to touch
files=(
  "docs/index.md"
  "docs/methodology/crop-failure-definitions.md"
  "docs/methodology/survey-econometrics-stata.md"
  "docs/methodology/spatial-prediction-r.md"
  "docs/methodology/satellite-workflow-r.md"
  "docs/methodology/validation-uncertainty.md"
  "docs/reports/README.md"
  "reports/pdf/README.md"
  "analysis/paper_survey_report/_quarto.yml"
  "analysis/paper_survey_report/report.qmd"
  "pipelines/00_setup_project.R"
  "pipelines/01_survey_outcomes.R"
  "pipelines/02_run_stata_models.R"
  "pipelines/03_spatial_prediction_survey.R"
  "pipelines/04_satellite_feature_build.R"
  "pipelines/05_satellite_failure_models.R"
  "pipelines/06_fusion_validation.R"
  "pipelines/99_render_reports.R"
  "stata/do/00_master.do"
  "stata/do/03_fractional_models.do"
  "stata/do/99_export_results.do"
  "R/io_paths.R"
  "R/survey_construct_outcomes.R"
  "R/survey_summary_tables.R"
  "R/spatial_covariates_stack.R"
  "R/spatial_models_predict.R"
  "R/satellite_features.R"
  "R/satellite_models_predict.R"
  "R/fusion_validate.R"
  "R/viz_maps.R"
)

# Loop to touch files if they don't exist
for file in "${files[@]}"; do
  [ -f "$file" ] || touch "$file"
done

echo "Project structure generated successfully."
