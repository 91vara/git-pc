pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the Git repository
                git 'https://github.com/91vara/git-pc.git' // Replace with your repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image for NGINX container
                    def image = docker.build("my-nginx:latest", ".")
                }
            }
        }

        stage('Deploy to Localhost') {
            steps {
                script {
                    // Stop and remove any existing container
                    sh "docker stop my-nginx || true"
                    sh "docker rm my-nginx || true"

                    // Run the Docker container on localhost
                    sh "docker run -d -p 9898:80 --name my-nginx my-nginx:latest"
                }
            }
        }
    }

    post {
        always {
            // Cleanup docker resources
            script {
                sh "docker rmi my-nginx:latest || true"
            }
        }
    }
}
