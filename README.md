# Terraform AWS Infrastructure Project

A Terraform project for managing AWS infrastructure with Lambda functions and S3 storage across multiple environments.

## Project Structure

```
terra-form-project/
├── env/
│   ├── dev/terraform.tfvars      # Development environment variables
│   ├── stg/terraform.tfvars      # Staging environment variables
│   └── prod/terraform.tfvars     # Production environment variables
├── module/
│   ├── main.tf                   # Main module resources
│   ├── provider.tf               # AWS provider configuration
│   ├── variable.tf               # Module variables
│   └── output.tf                 # Module outputs
├── lambda-main.tf                # Lambda function configuration
├── s3-main.tf                    # S3 bucket configuration
└── variable.tf                   # Root variables
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- AWS CLI configured with appropriate credentials
- AWS IAM permissions for Lambda and S3 services

## Getting Started

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Plan Deployment

For development environment:
```bash
terraform plan -var-file="env/dev/terraform.tfvars"
```

For staging environment:
```bash
terraform plan -var-file="env/stg/terraform.tfvars"
```

For production environment:
```bash
terraform plan -var-file="env/prod/terraform.tfvars"
```

### 3. Apply Configuration

```bash
terraform apply -var-file="env/dev/terraform.tfvars"
```

### 4. Destroy Resources (when needed)

```bash
terraform destroy -var-file="env/dev/terraform.tfvars"
```

## Environment Configuration

Each environment has its own `terraform.tfvars` file in the `env/` directory:

- `env/dev/terraform.tfvars` - Development settings
- `env/stg/terraform.tfvars` - Staging settings  
- `env/prod/terraform.tfvars` - Production settings

## Resources Created

- **Lambda Function**: Serverless compute function
- **S3 Bucket**: Object storage with versioning and encryption
- **IAM Role**: Execution role for Lambda function

## Commands Reference

| Command | Description |
|---------|-------------|
| `terraform init` | Initialize working directory |
| `terraform plan` | Show execution plan |
| `terraform apply` | Apply configuration |
| `terraform destroy` | Destroy resources |
| `terraform fmt` | Format configuration files |
| `terraform validate` | Validate configuration |

## Contributing

1. Make changes to the appropriate `.tf` files
2. Run `terraform fmt` to format code
3. Run `terraform validate` to check syntax
4. Test with `terraform plan`
5. Commit and push changes

## Notes

- Sensitive files like `*.tfstate` and `*.tfvars` are excluded from version control
- Always review the plan before applying changes
- Use appropriate environment-specific variable files