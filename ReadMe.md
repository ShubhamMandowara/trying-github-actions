# Text Processor Application

This is a simple Flask application that adds "hello" to input text, deployed on Azure Kubernetes Service (AKS) using GitHub Actions for CI/CD and Terraform for infrastructure.

## Project Structure
```
.
├── app.py                 # Flask application
├── requirements.txt       # Python dependencies
├── Dockerfile            # Container configuration
├── k8s/                  # Kubernetes manifests
├── terraform/            # Infrastructure as Code
└── .github/workflows/    # CI/CD pipeline
```

## Prerequisites
1. Azure subscription
2. GitHub account
3. Azure CLI
4. Terraform
5. kubectl

## Setup Instructions

1. Create Azure Service Principal and add to GitHub Secrets:
```bash
az ad sp create-for-rbac --name "text-processor" --role contributor \
                        --scopes /subscriptions/{subscription-id} \
                        --sdk-auth
```
Add the output JSON as a GitHub secret named 'AZURE_CREDENTIALS'

2. Initialize Terraform and deploy infrastructure:
```bash
cd terraform
terraform init
terraform apply
```

3. Configure Azure Container Registry credentials in GitHub Secrets:
- AZURE_CONTAINER_REGISTRY
- REGISTRY_USERNAME
- REGISTRY_PASSWORD

4. Push code to GitHub to trigger the CI/CD pipeline

## API Usage
Send a POST request to `/process` endpoint:
```bash
curl -X POST -H "Content-Type: application/json" \
     -d '{"text":"world"}' \
     http://your-service-ip/process
```

Response:
```json
{
    "result": "hello world"
}
```
