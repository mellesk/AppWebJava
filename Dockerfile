FROM tomcat:8.0.20-jre8 
COPY target/AppWebJava*.war /usr/local/tomcat/webapps/AppWebJava.war
