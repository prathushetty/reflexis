
pipeline {
    agent any

    parameters {
        string(name: 'RETENTION_DAYS', defaultValue: '4', description: 'Enter the retention period for logs in days (default is 4 days)')
    }

    environment {
        GIT_REPO_URL = 'https://github.com/prathushetty/reflexis.git'
        GIT_BRANCH = 'main' 
        GIT_BASH_PATH = '"C:\\Program Files\\Git\\bin\\bash.exe"'
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
                    bat """
                    ${env.GIT_BASH_PATH} -c "chmod +x db2archlogs_cleanup.sh"
                    ${env.GIT_BASH_PATH} -c  "./db2archlogs_cleanup.sh ${params.RETENTION_DAYS}"
                    """
                }
            }
        }
    }

}
