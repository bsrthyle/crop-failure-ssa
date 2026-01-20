$ErrorActionPreference = "Stop"

# Create directories
$directories = @(
    ".github/workflows",
    "docs/methodology",
    "docs/reports",
    "reports/pdf",
    "reports/briefs",
    "reports/figures",
    "config",
    "renv",
    "R",
    "pipelines",
    "stata/do",
    "stata/ado",
    "stata/logs",
    "analysis/paper_survey_report/figs",
    "analysis/paper_survey_report/tables",
    "data/raw",
    "data/interim",
    "data/processed",
    "data/metadata/checksums",
    "outputs/public/figures",
    "outputs/public/tables",
    "outputs/public/maps",
    "outputs/public/logs",
    "outputs/private",
    "tests/testthat"
)

foreach ($dir in $directories) {
    if (-not (Test-Path -Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

# Helper function to create file if not exists
function Create-File-If-Not-Exists {
    param (
        [string]$Path,
        [string]$Content
    )
    if (-not (Test-Path -Path $Path)) {
        Set-Content -Path $Path -Value $Content -Encoding UTF8
    }
}

# Create README.md
$readmeContent = @"
# Crop Failure SSA

This repository contains the analytical framework for assessing crop failure in Sub-Saharan Africa (SSA).
It integrates household survey data with spatial prediction modeling and satellite imagery analysis.
The workflow utilizes both R and Stata for econometric analysis, feature engineering, and predictive modeling.
Key components include survey sampling weights, spatial covariate selection, and fusion validation of failure definitions.
Structure includes pipelines for data processing, Stata estimation, and R-based spatial predictions.
"@
Create-File-If-Not-Exists -Path "README.md" -Content $readmeContent

# Create .gitignore
$gitignoreContent = @"
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
"@
Create-File-If-Not-Exists -Path ".gitignore" -Content $gitignoreContent

# Create CITATION.cff
$citationContent = @"
cff-version: 1.2.0
title: "Crop Failure SSA"
authors:
  - family-names: "Doe"
    given-names: "Jane"
version: 0.1.0
"@
Create-File-If-Not-Exists -Path "CITATION.cff" -Content $citationContent

# Create CHANGELOG.md
Create-File-If-Not-Exists -Path "CHANGELOG.md" -Content ""

# Create Makefile
$makefileContent = @"
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
"@
Create-File-If-Not-Exists -Path "Makefile" -Content $makefileContent

# Create config/config.yml
$configContent = @"
paths:
survey:
econometrics:
spatial_prediction_survey:
satellite:
fusion:
render:
"@
Create-File-If-Not-Exists -Path "config/config.yml" -Content $configContent

# Create .github/workflows/ci.yml
$ciContent = @"
name: CI
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
"@
Create-File-If-Not-Exists -Path ".github/workflows/ci.yml" -Content $ciContent

# List of empty files to touch
$filesToTouch = @(
  "docs/index.md",
  "docs/methodology/crop-failure-definitions.md",
  "docs/methodology/survey-econometrics-stata.md",
  "docs/methodology/spatial-prediction-r.md",
  "docs/methodology/satellite-workflow-r.md",
  "docs/methodology/validation-uncertainty.md",
  "docs/reports/README.md",
  "reports/pdf/README.md",
  "analysis/paper_survey_report/_quarto.yml",
  "analysis/paper_survey_report/report.qmd",
  "pipelines/00_setup_project.R",
  "pipelines/01_survey_outcomes.R",
  "pipelines/02_run_stata_models.R",
  "pipelines/03_spatial_prediction_survey.R",
  "pipelines/04_satellite_feature_build.R",
  "pipelines/05_satellite_failure_models.R",
  "pipelines/06_fusion_validation.R",
  "pipelines/99_render_reports.R",
  "stata/do/00_master.do",
  "stata/do/03_fractional_models.do",
  "stata/do/99_export_results.do",
  "R/io_paths.R",
  "R/survey_construct_outcomes.R"
  "R/survey_summary_tables.R",
  "R/spatial_covariates_stack.R"
  "R/spatial_models_predict.R"
  "R/satellite_features.R"
  "R/satellite_models_predict.R"
  "R/fusion_validate.R"
  "R/viz_maps.R"
)

foreach ($file in $filesToTouch) {
    Create-File-If-Not-Exists -Path $file -Content ""
}

Write-Host "Project structure generated successfully."
