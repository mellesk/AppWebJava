node{
    
    stage('Chargemet depuis Github'){
        git branch: 'main', url: 'https://github.com/medsalahmeddeb/AppWebJava'
    }
    
    stage('Construction  du projet par MAVEN'){
        
        echo "Début de la construction"
        def mvn_path = tool name: 'MAVEN3', type: 'maven'
        sh "${mvn_path}/bin/mvn clean install package"
    } 
    /*
    stage('Deploimement sur tomacat container'){
        sshagent(['root-jenkins']) {
           sh "mv target/AppWebJava*.war target/myweb.war"
            sh "scp -o StrictHostKeyChecking=no target/myweb.war root@192.168.118.154:/opt/tomcat8/webapps/"
            sh "ssh root@192.168.118.154 /opt/tomcat8/bin/shutdown.sh"
            sh "ssh root@192.168.118.154 /opt/tomcat8/bin/startup.sh"
        }
    }*/
    stage('Deploimement sur tomacat container'){
        deploy adapters: [tomcat8(credentialsId: 'deployer_user', path: '', 
        url: 'http://192.168.118.154:8088/')], 
        contextPath: null, 
        war: '**/*.war'
    }
    
    stage ('Notification'){
        mail bcc: '', body: 'Build app', cc: '', from: '', replyTo: '', subject: 'Build app', to: 'medsalah.meddeb@gmail.com'
    }
}
