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
