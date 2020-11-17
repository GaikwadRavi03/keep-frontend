pipeline { 
    agent any 
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('package creation') { 
            steps { 
                sh ''' #!/bin/bash
                cd /var/lib/jenkins/workspace/
                rsync -avzP -e 'ssh -i /my-mumbai-key.pem' /var/lib/jenkins/workspace/keep-frontend-pipeline ubuntu@13.232.191.197:/home/ubuntu/
                echo ===> package creation stage
                '''
            }
        }
        stage('Build') { 
            steps { 
                sh ''' #!/bin/bash
                ssh -i /my-mumbai-key.pem ubuntu@13.232.191.197
                cd /home/ubuntu/keep-frontend-pipeline
                npm install
                npm run build
                echo ===> Build stage
                '''
            }
        }
        stage('Test') { 
            steps {
                sh 'echo test case runs' 
            }
        }
        stage('deploy') { 
            steps {
                sh ''' #!/bin/bash
                ssh -i /my-mumbai-key.pem ubuntu@13.232.191.197
                cd /home/ubuntu/keep-frontend-pipeline
                pm2 serve build 3000
                echo ===> deploy stage
                '''
            }
        }
    }
}
