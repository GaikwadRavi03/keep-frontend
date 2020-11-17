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
                rsync -avzP -e 'ssh -i /my-mumbai-key.pem' /var/lib/jenkins/workspace/keep-frontend-pipeline ubuntu@13.232.87.186:/home/ubuntu/
                echo ===> package creation on frontend server
                '''
            }
        }
        stage('Build') { 
            steps { 
                sh ''' #!/bin/bash
                ssh -i /my-mumbai-key.pem ubuntu@13.232.87.186
                cd /home/ubuntu/
                rm -rf keep-frontend
                touch raviFrontEnd.txt
                #mv keep-frontend-pipeline keep-frontend
                #cd keep-frontend
                #npm install
                #npm run build
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
                ssh -i /my-mumbai-key.pem ubuntu@13.232.87.186
                cd /home/ubuntu/keep-frontend
                pm2 kill
                pm2 serve build 3000
                echo ===> deploy stage
                '''
            }
        }
    }
}
