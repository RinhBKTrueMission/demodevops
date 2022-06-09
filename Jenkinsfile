pipeline {
    agent any
    tools {
    maven 'maven 3.8.5'
  }
    stages {
        stage('Build') {
            steps{
            withMaven{
                sh 'mvn clean install -f demodevops/pom.xml'

               }
            }
        }
        stage('Initialize'){
                def dockerHome = tool 'RinhTran'
                env.PATH = "${dockerHome}/bin:${env.PATH}"
            }
        stage('Docker Build and Tag') {
                   steps {

                        sh 'docker build -t testOps:latest .'
                        sh 'docker tag testOps rinhtt/testOps:latest'


                  }
                }

          stage('Publish image to Docker Hub') {
                    steps {
                withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
                  sh  'docker push rinhtt/testOps:latest'

                }

                  }
                }

              stage('Run Docker container on Jenkins Agent') {

                    steps {
                        sh "docker run -d -p 8003:8080 rinhtt/testOps"
                    }
                }
              stage('Run Docker container on remote hosts') {
                    steps {
                        sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 rinhtt/testOps"

                    }
                }
          }
    }

