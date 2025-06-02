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

### Dry-run Terraform destroy plan
echo "📋 Running a dry-run Terraform destroy plan.."
echo "📋 This will show what resources would be destroyed without actually performing any deletions..."
terraform plan -destroy -var-file="$TFVARS_FILE"

echo "⚠️ Are you sure you want to destroy the resources? This action will execute Terraform Destroy Command."
read -p "Type 'yes' to proceed with execute Terraform Destroy Command: " confirm

if [ "$confirm" != "yes" ]; then
  echo "❌ Destroy operation cancelled."
  exit 0
fi

### Terraform destroy
echo "🚀 Running Terraform Destroy..."
echo "🔥 We need to manually type "yes" to proceed..."
terraform destroy -var-file="$TFVARS_FILE"

echo "✅ Terraform Destroy Completed for Environment: $ENV"
echo "✅ Please log in to your Azure account and verify the resources from the Azure Portal."

