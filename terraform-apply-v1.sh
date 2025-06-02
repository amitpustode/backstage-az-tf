#!/bin/bash

# --------------------------------------------------------------------------------
# Note: Please run this script from the root directory of your Terraform code."
# 🛠️ Required Dependencies to Run This Script:
# - terraform   => Infrastructure as Code CLI
# - bash        => Linux shell interpreter
# --------------------------------------------------------------------------------

set -e  # Stop the script on any error

### Input Parameters
ENV=${1}  # Accept environment as the first argument

### If ENV is not provided, prompt user for input
if [ -z "$ENV" ]; then
  echo "❗Please enter the environment (e.g., dev, qa, staging, prod):"
  read ENV
fi

### Check if environment is valid
VALID_ENVS=("dev" "qa" "staging" "prod")
if [[ ! " ${VALID_ENVS[@]} " =~ " ${ENV} " ]]; then
  echo "❌ Invalid environment. Valid options are: dev, qa, staging, prod."
  exit 1
fi

### Print a message saying the entered environment is valid
echo "✅ Entered environment '${ENV}' is valid."

### File Paths
BACKEND_FILE="./Environments/${ENV}/${ENV}-backend.tf"
TFVARS_FILE="./Environments/${ENV}/${ENV}.tfvars"

### Check backend config exists
if [ ! -f "$BACKEND_FILE" ]; then
  echo "❌ Backend config not found, Expected at: $BACKEND_FILE"
  exit 1
else
  echo "✅ Backend config found at: $BACKEND_FILE"  
fi

### Check tfvars file exists
if [ ! -f "$TFVARS_FILE" ]; then
  echo "❌ tfvars file not found, Expected at: $TFVARS_FILE"
  exit 1
else
  echo "✅ tfvars file found at: $TFVARS_FILE"  
fi

### Terraform Init
echo "🔄 Running Terraform Init..."
#terraform init -backend-config="$BACKEND_FILE"
terraform init -reconfigure -backend-config="$BACKEND_FILE"

### Terraform validate
echo "🔍 Running Terraform Validate..."
terraform validate

### Terraform plan
echo "📋 Running Terraform Plan..."
terraform plan -var-file="$TFVARS_FILE"

#### Confirmation before Apply
echo "⚠️ Please review the plan above. Are you sure you want to execute terraform apply command?"
read -p "Type 'yes' to proceed with the execute terraform apply command: " confirm

if [ "$confirm" != "yes" ]; then
  echo "❌ Apply operation cancelled."
  exit 0
fi

### Terraform apply
echo "🚀 Running Terraform Apply...(We need to manually type "yes" to approval)"
terraform apply -var-file="$TFVARS_FILE"
#terraform apply -auto-approve -var-file="$TFVARS_FILE" 

echo "✅ Terraform Apply Finished for Environment: $ENV"
echo "✅ Please log in to your Azure account and verify the resources from the Azure Portal."
