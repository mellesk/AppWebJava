pipeline {
 agent any
 stages {
 stage('Checkout') {
 steps {
 git branch: 'main', 
 url: 'https://github.com/mellesk/AppWebJava'
 }
 } 
 stage('Build'){
 tools{
 maven 'Maven'
 }
 steps{
 sh 'mvn clean install'
 }
 }
 
 stage('Build Docker Image') {
 steps {
 sh "sudo docker build -t 132020/appwebjava:1.0.0 /var/lib/jenkins/workspace/${JOB_NAME}"
 }
 }
 
 stage('Upload To DockerHub') {
 environment {
 PASS = credentials('docker')
 }
 steps {
 echo "${PASS}"
 sh "sudo docker login -u '132020' -p \'${PASS}\'"
 sh "sudo docker push 132020/appwebjava:1.0.0"
 }
 }
 
 stage('Deploy app container') {
 steps {
 sh "sudo docker rm -f appwebjava"
 sh "sudo docker run -d -p 80:8585 --name appwebjava 132020/appwebjava:1.0.0"
 }
 }
 }
}
