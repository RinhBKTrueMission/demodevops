pipeline {
    agent any
    tools {
    maven 'maven 3.8.5'
  }
    stages {
//         stage('Clone') {
//             steps {
//                 sh 'git clone https://github.com/RinhBKTrueMission/demodevops.git'
//             }
//         }
        // stage('Test'){
        //     steps{

        //     }
        // }

        stage('Build') {
            steps{
            withMaven{
                sh 'mvn clean install -f demodevops/pom.xml'
                //sh 'mvn -B -DskipTests clean package'
            }
        }
        }
        stage('Deploy'){
            steps{
                sh 'cp /var/lib/jenkins/jobs/spring-boot-hello/workspace/target/spring-boot-hello-0.0.1-SNAPSHOT.jar D:/FPGA/spring-boot-hello.jar'
            }
        }
    }
}