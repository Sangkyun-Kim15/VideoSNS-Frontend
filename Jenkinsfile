pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Sangkyun-Kim15/VideoSNS-Frontend'
            }
        }
        stage('Install Dependencies') {
            steps {
                script {
                    // Install npm dependencies
                    sh 'npm install'
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build the React app
                    sh 'npm run build'
                }
            }
        }
        // Disabled 'Test' stage temporarily
        // stage('Test') {
        //     steps {
        //         script {
        //             // Run any tests if set up
        //         }
        //     }
        // }
        stage('Docker Build and Push') {
            steps {
                script {
                    // Docker login using credentials stored in Jenkins
                    withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                        sh 'echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin'
                    }

                    // Build and push Docker image
                    sh 'docker build -t sabackwon/videosns-frontend .'
                    sh 'docker push sabackwon/videosns-frontend'
                }
            }
        }
        stage('Deploy') {
            steps {
                // Deployment steps, if automated deployment is set up
                echo 'Deployment step to be implemented'
            }
        }
    }
}