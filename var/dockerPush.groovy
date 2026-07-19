def call(String image, String region, String accountId, String repository) {

    sh """

    aws ecr get-login-password --region ${region} | \
    docker login \
    --username AWS \
    --password-stdin ${accountId}.dkr.ecr.${region}.amazonaws.com

    docker tag ${image}:latest \
    ${accountId}.dkr.ecr.${region}.amazonaws.com/${repository}:${BUILD_NUMBER}

    docker push \
    ${accountId}.dkr.ecr.${region}.amazonaws.com/${repository}:${BUILD_NUMBER}

    """
}
