#/bin/bash
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")


AWS_ACCOUNT_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .accountId)
AWS_REGION=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)

ECR_REPO_NAME="project-a/sample-repo"
IMAGE_TAG="latest"
aws ecr-public create-repository --repository-name $ECR_REPO_NAME --region us-east-1 || true


REPOSITORY_URI=$(aws ecr-public describe-repositories --repository-name $ECR_REPO_NAME --region us-east-1 --query 'repositories[0].repositoryUri' --output text)
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws


docker build -t $ECR_REPO_NAME:$IMAGE_TAG .
docker tag $ECR_REPO_NAME:$IMAGE_TAG $REPOSITORY_URI:$IMAGE_TAG
docker push $REPOSITORY_URI:$IMAGE_TAG

sed -i "s|image:.*|image: ${REPOSITORY_URI}:${IMAGE_TAG}|" deployment.yaml


