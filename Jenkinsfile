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
 sh "docker build -t 132020/appwebjava:1.0.0 /var/lib/jenkins/workspace/${JOB_NAME}"
 }
 }
 
 stage('Upload To DockerHub') {
 environment {
 PASS = credentials('docker_pass')
 }
 steps {
 echo "${PASS}"
 sh "docker login -u '132020' -p \'${PASS}\'"
 sh "docker push 132020/appwebjava:1.0.0"
 }
 }
 
 stage('Deploy app container') {
 steps {
 sh "docker rm -f appwebjava"
 sh "docker run -d -p 8585:8080 --name appwebjava 132020/appwebjava:1.0.0"
 }
 }
 }
}
