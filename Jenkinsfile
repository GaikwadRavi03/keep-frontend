pipeline { 
    agent any 
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') { 
            steps { 
                sh 'npm install' 
                sh 'npm run build'
            }
        }
        stage('Test') { 
            steps {
                sh 'echo test case runs' 
            }
        }
    }
}
