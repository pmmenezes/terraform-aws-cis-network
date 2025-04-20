# Caminhos
RESULTS_DIR=check_results
CHECKOV_OUT=$(RESULTS_DIR)/checkov/report.json
TRIVY_OUT=$(RESULTS_DIR)/trivy/report.json
TERRASCAN_OUT=$(RESULTS_DIR)/terrascan/report.json

# Cria pastas de resultados
init:
	mkdir -p $(RESULTS_DIR)/checkov
	mkdir -p $(RESULTS_DIR)/trivy
	mkdir -p $(RESULTS_DIR)/terrascan

# Rodar Checkov
checkov:
	checkov -d ./examples --framework terraform  --download-external-modules true -o json > $(CHECKOV_OUT)

# Rodar Trivy
trivy:
	trivy config . --format json > $(TRIVY_OUT)

# Rodar Terrascan
terrascan:
	terrascan scan -t aws -i terraform -o json > $(TERRASCAN_OUT) 

# Rodar todos
scan: init checkov trivy terrascan
