# EKSJenkins

This repository contains the necessary files and scripts to set up a CI/CD pipeline using Jenkins for deploying to an Amazon EKS (Elastic Kubernetes Service) cluster.

## Project Structure

The repository includes the following key files and directories:

- `Jenkinsfile`: Defines the CI/CD pipeline stages
- `depend.sh`: Script for setting up dependencies
- `awsConfigure.sh`: Script for AWS configuration
- `image.sh`: Script for building Docker images
- `deployment.yaml`: Kubernetes deployment configuration
- `service.yaml`: Kubernetes service configuration
- Terraform files (`.tf`): Infrastructure as Code for EKS setup

## Pipeline Stages

The Jenkins pipeline includes the following stages:

1. Checkout: Clone the repository
2. Run Dependency Script: Execute `depend.sh`
3. Configure AWS: Run `awsConfigure.sh`
4. Build Image: Execute `image.sh`
5. Terraform Init: Initialize Terraform
6. Terraform Validate: Validate Terraform configuration
7. Terraform Plan: Create execution plan
8. Terraform Format: Format Terraform files
9. Terraform Apply: Apply Terraform changes (auto-approved)
10. Deploy to EKS: Update kubeconfig and apply Kubernetes manifests

## Setup Instructions

1. Ensure Jenkins is set up with necessary plugins (AWS, Terraform, Kubernetes)
2. Configure Jenkins credentials for AWS access
3. Create a new Jenkins pipeline job using the provided `Jenkinsfile`
4. Adjust environment variables in the `Jenkinsfile` as needed:
   - `AWS_DEFAULT_REGION`
   - `EKS_CLUSTER_NAME`
5. Run the pipeline

## Prerequisites

- Jenkins server with required plugins
- AWS CLI
- Terraform
- kubectl

## Notes

- Ensure all scripts have execute permissions
- Review and adjust Terraform configurations as needed
- The pipeline uses auto-approve for Terraform apply, use caution in production environments

For more details on each component, refer to the individual files in the repository.
