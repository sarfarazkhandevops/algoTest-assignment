def call(String serviceName, String port) {

    sh """

    echo "Waiting for application to be ready..."

    sleep 20


    echo "Running Kubernetes connectivity test"


    kubectl run curl-test \
    --image=curlimages/curl \
    --restart=Never \
    --rm \
    -i \
    -- curl -f http://${serviceName}:${port}



    echo "Application verification successful"

    """
}
