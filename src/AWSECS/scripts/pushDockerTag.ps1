
param
(
    [string]$AWS_PROFILE_NAME,
    [string]$DOCKER_IMAGE_NAME,
    [string]$AWSECS_DOCKER_TAG_NAME,
    [string]$AWSECS_ECR_REPO_URI
)

Invoke-Expression -Command (Get-ECRLoginCommand -ProfileName $AWS_PROFILE_NAME -Region us-east-1).Command
docker tag $DOCKER_IMAGE_NAME ${AWSECS_ECR_REPO_URI}:$AWSECS_DOCKER_TAG_NAME
docker push ${AWSECS_ECR_REPO_URI}:${AWSECS_DOCKER_TAG_NAME}