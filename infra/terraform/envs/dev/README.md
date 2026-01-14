# Development Environment

This directory contains the Terraform configurations for the development environment. It is designed to provision and manage infrastructure resources tailored for development and testing purposes.

---

## Overview

The development environment is a sandboxed setup where new features and changes can be tested before being promoted to production. It mirrors the production environment as closely as possible to ensure reliable testing outcomes.

---

## Usage Instructions

1. **Initialize Terraform**:
   Navigate to the `infra/terraform/envs/dev/` directory and initialize Terraform:
   ```bash
   terraform init
   ```

2. **Plan Changes**:
   Review the infrastructure changes that will be applied:
   ```bash
   terraform plan
   ```

3. **Apply Changes**:
   Apply the Terraform configurations to provision the development environment:
   ```bash
   terraform apply
   ```

4. **Destroy Resources**:
   When the environment is no longer needed, destroy the resources to save costs:
   ```bash
   terraform destroy
   ```

---

## Troubleshooting

- **Terraform Initialization Errors**:
  - Ensure that the backend configuration is correct.
  - Verify that you have the necessary permissions to access the remote state.

- **Resource Provisioning Failures**:
  - Check the Terraform logs for detailed error messages.
  - Ensure that all required variables are defined in the `terraform.tfvars` file.

- **State File Conflicts**:
  - Avoid running Terraform commands simultaneously from multiple locations.
  - Use state locking to prevent conflicts.

---

This development environment setup is a critical part of the infrastructure lifecycle, enabling teams to test and validate changes in a safe and controlled manner.
