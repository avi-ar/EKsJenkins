EKSJenkins
This repository contains the necessary files and scripts to set up a CI/CD pipeline using Jenkins for deploying to an Amazon EKS (Elastic Kubernetes Service) cluster.
Project Structure
The repository includes the following key files and directories:

Jenkinsfile: Defines the CI/CD pipeline stages
depend.sh: Script for setting up dependencies
awsConfigure.sh: Script for AWS configuration
image.sh: Script for building Docker images
deployment.yaml: Kubernetes deployment configuration
service.yaml: Kubernetes service configuration
Terraform files (.tf): Infrastructure as Code for EKS setup

Pipeline Stages
The Jenkins pipeline includes the following stages:

Checkout: Clone the repository
Run Dependency Script: Execute depend.sh
Configure AWS: Run awsConfigure.sh
Build Image: Execute image.sh
Terraform Init: Initialize Terraform
Terraform Validate: Validate Terraform configuration
Terraform Plan: Create execution plan
Terraform Format: Format Terraform files
Terraform Apply: Apply Terraform changes (auto-approved)
Deploy to EKS: Update kubeconfig and apply Kubernetes manifests

Setup Instructions

Ensure Jenkins is set up with necessary plugins (AWS, Terraform, Kubernetes)
Configure Jenkins credentials for AWS access
Create a new Jenkins pipeline job using the provided Jenkinsfile
Adjust environment variables in the Jenkinsfile as needed:

AWS_DEFAULT_REGION
EKS_CLUSTER_NAME


Run the pipeline

Prerequisites

Jenkins server with required plugins
AWS CLI
Terraform
kubectl

Notes

Ensure all scripts have execute permissions
Review and adjust Terraform configurations as needed
The pipeline uses auto-approve for Terraform apply, use caution in production environments

For more details on each component, refer to the individual files in the repository.
