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
                sudo cp keep-frontend /home/ubuntu
                cd /home/ubuntu
                '''
            }
        }
        stage('Build') { 
            steps { 
                sh ''' #!/bin/bash
                cd /home/ubuntu/keep-frontend
                sudo npm install
                sudo npm run build
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
                cd /home/ubuntu/keep-frontend
                sudo pm2 serve build 3000
                sudo service nginx stop && sudo service nginx start
                '''
            }
        }
    }
}
