# Terraform (EKS-ready layout)

This directory contains Terraform configurations for setting up an EKS-ready platform. While Terraform is not required for the local `kind` setup, it provides a scalable and production-ready alternative for deploying the platform on AWS. It includes environment-specific configurations and supports remote state storage for collaboration.

---

## Prerequisites

- **Terraform**: Installed on your local machine. [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- **AWS CLI**: Configured with credentials for your AWS account.
- **Backend Configuration**: For production, configure remote state storage (e.g., S3 bucket).
- **IAM Permissions**: Ensure your AWS user has the necessary permissions to create EKS clusters, VPCs, and related resources.

---

## Setup Instructions

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```
   This command initializes the Terraform working directory and downloads the required provider plugins.

2. **Plan the Deployment**:
   ```bash
   terraform plan -var-file=envs/dev/terraform.tfvars
   ```
   This command generates an execution plan for the `dev` environment.

3. **Apply the Configuration**:
   ```bash
   terraform apply -var-file=envs/dev/terraform.tfvars
   ```
   This command deploys the infrastructure to your AWS account.

4. **Switch Environments**:
   To deploy to a different environment (e.g., `prod`), use the corresponding `terraform.tfvars` file:
   ```bash
   terraform plan -var-file=envs/prod/terraform.tfvars
   terraform apply -var-file=envs/prod/terraform.tfvars
   ```

---

## Validation

After applying the Terraform configuration, verify the deployment:

1. **Check EKS Cluster**:
   ```bash
   aws eks describe-cluster --name <cluster-name>
   ```

2. **Verify Node Groups**:
   ```bash
   aws eks list-nodegroups --cluster-name <cluster-name>
   ```

3. **Check Terraform State**:
   ```bash
   terraform state list
   ```
   Ensure all resources are listed in the Terraform state.

4. **Access the Kubernetes Cluster**:
   Update your kubeconfig to access the EKS cluster:
   ```bash
   aws eks update-kubeconfig --name <cluster-name>
   ```
   Verify the connection:
   ```bash
   kubectl get nodes
   ```

---

## Troubleshooting

- **Terraform Initialization Fails**:
  - Ensure your AWS credentials are configured correctly:
    ```bash
    aws configure
    ```

- **Resource Creation Errors**:
  - Check the AWS service limits for your account.
  - Review the Terraform execution plan for misconfigurations.

- **State File Issues**:
  - If using remote state, ensure the backend (e.g., S3 bucket) is accessible.

- **Cluster Connection Issues**:
  - Verify that your kubeconfig is updated with the correct cluster details.
  - Check the security group rules for the EKS cluster.

---

This directory is designed to support a seamless transition to a production-grade EKS deployment, including remote state, IAM roles, and environment-specific configurations. It is modular and can be extended to include additional AWS resources as needed.
