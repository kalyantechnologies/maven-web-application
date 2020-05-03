FROM tomcat:8.0.20-jre8
# Dummy text to test
COPY target/maven-web-app*.war /home/ubuntu/maven-web-application/target/maven-web-app.war
