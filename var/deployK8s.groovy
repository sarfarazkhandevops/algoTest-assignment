def call(String cluster,
         String region,
         String deploymentFile,
         String serviceFile,
         String accountId,
         String repository) {

    sh """

    aws eks update-kubeconfig \
    --region ${region} \
    --name ${cluster}

    sed -i "s|IMAGE|${accountId}.dkr.ecr.${region}.amazonaws.com/${repository}:${BUILD_NUMBER}|g" ${deploymentFile}

    kubectl apply -f ${deploymentFile}

    kubectl apply -f ${serviceFile}

    kubectl rollout status deployment/flask-app

    """
}
