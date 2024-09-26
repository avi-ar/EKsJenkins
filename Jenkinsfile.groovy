pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'eu-west-1'
        EKS_CLUSTER_NAME = 'Eks'
    }

    stages {
        stage('Checkout') {
            steps {
                
                git 'https://github.com/yourusername/yourrepository.git'
            }
        }

        stage('Run Dependency Script') {
            steps {
                sh 'chmod +x depend.sh && ./depend.sh'
            }
        }

        stage('Configure AWS') {
            steps {
                sh 'chmod +x awsConfigure.sh && ./awsConfigure.sh'
            }
        }

        stage('Build Image') {
            steps {
                sh 'chmod +x image.sh && ./image.sh'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Format') {
            steps {
                sh 'terraform fmt'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh """
                    aws eks --region ${AWS_DEFAULT_REGION} update-kubeconfig --name ${EKS_CLUSTER_NAME}
                    kubectl apply -f deployment.yaml
                    kubectl apply -f service.yaml
                """
            }
        }
    }
}