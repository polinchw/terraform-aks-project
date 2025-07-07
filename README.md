# terraform-aks-project

This project provisions an Azure Kubernetes Service (AKS) cluster using Terraform. It is structured to support multiple environments, including development and production.

## Project Structure

```
terraform-aks-project
├── modules
│   └── aks
│       ├── variables.tf     # Input variables for the AKS module
│       └── outputs.tf       # Outputs for the AKS module
├── environments
│   ├── dev
│   │   └── terraform.tfvars  # Variable values for the development environment
│   └── prod
│       └── terraform.tfvars  # Variable values for the production environment
├── main.tf                  # Entry point for the Terraform project
├── variables.tf             # Input variables for the root module
├── outputs.tf               # Outputs for the root module
├── providers.tf             # Specifies required providers
├── versions.tf              # Specifies required Terraform and provider versions
└── README.md                # Project documentation
```

## Setup Instructions

1. **Install Terraform**: Ensure you have Terraform installed on your machine. You can download it from [terraform.io](https://www.terraform.io/downloads.html).

2. **Configure Azure Credentials**: Make sure you have the Azure CLI installed and you are logged in. You can log in using:
   ```bash
   az login
   ```

3. **Initialize the Project**: Navigate to the project directory and run:
   ```bash
   terraform init
   ```

4. **Select Environment**: Choose the environment you want to deploy (dev or prod) and navigate to the corresponding directory.

5. **Apply Configuration**: Run the following command to apply the Terraform configuration:
   ```bash
   terraform apply
   ```

6. **Destroy Resources**: To remove the resources created by Terraform, use:
   ```bash
   terraform destroy
   ```

## Usage

- Modify the `terraform.tfvars` files in the `environments/dev` and `environments/prod` directories to customize the resource configurations for each environment.
- Use the `modules/aks` directory to adjust the AKS module settings as needed.

## Azure Subscription

Ensure that you have set the `ARM_SUBSCRIPTION_ID` environment variable to your Azure subscription ID. You can do this by adding the following line to your shell configuration file (e.g., `.bashrc`, `.zshrc`):
```
export TF_VAR_subscription_id=<your_subscription_id>
```
## License

This project is licensed under the MIT License. See the LICENSE file for details.