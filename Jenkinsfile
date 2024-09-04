
pipeline {
    agent any

    parameters {
        string(name: 'RETENTION_DAYS', defaultValue: '4', description: 'Enter the retention period for logs in days (default is 4 days)')
    }

    environment {
        GIT_REPO_URL = 'https://github.com/prathushetty/reflexis.git'
        GIT_BRANCH = 'main' 
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Checkout the GitHub repository
                git branch: "${GIT_BRANCH}", url: "${GIT_REPO_URL}"
            }
        }

        stage('Run Cleanup Script') {
            steps {
                script {
                    // Make the script executable and run it
                    // sh "chmod +x db2archlogs_cleanup.sh"
                    bat "./db2archlogs_cleanup.sh ${params.RETENTION_DAYS}"
                }
            }
        }
    }

    post {
        always {
            // Archive the logs generated during the script execution
            archiveArtifacts artifacts: '**/*.log', allowEmptyArchive: true
        }

        cleanup {
            // Clean up workspace after the build is done
            cleanWs()
        }
    }
}
