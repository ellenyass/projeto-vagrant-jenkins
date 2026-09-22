pipeline{
    agent any
    stages{
        stage('Instalar dependências'){
            steps{
                sh "cd app && npm install"
            }
        }

        stage('Build'){
            steps{
               sh "cd app && npm run build"
            }
        }

        stage('Testes'){
            steps{
                sh "cd app && npm test"
            }
        }

         stage("Deploy") {
            steps {
                sshagent(credentials: ["app"]) {
                    sh "scp -r app/ vagrant@192.168.56.20:/home/vagrant/"
                }
            }
        }

    }

    post {
            success{
                echo "Pipeline executada com sucesso"
            }

            failure {
            echo "Pipeline falhou"
        }
        }

}
