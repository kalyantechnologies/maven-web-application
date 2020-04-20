node('nodes')
{
    def mavenHome = tool name:"maven 3.6.2"
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])
    stage('checkout')
    {
        git branch: 'development', credentialsId: 'cdfcff52-5604-42f7-ab78-04d958e78524', url: 'https://github.com/kalyantechnologies/maven-web-application.git'
    }
    stage('Build')
    {
        sh "${mavenHome}/bin/mvn clean package"
    }   
    stage('uploadartifactintonexus')
    {
        sh "${mavenHome}/bin/mvn deploy"
    }
    stage('deployapplicationintitomcatserver')
    {
        sshagent(['ff88cc0d-d595-49a1-bb53-6d7d0c8de7eb']) {
            sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@15.206.167.46://opt/apache-tomcat-9.0.33/webapps/"
}
}
stage('emilnotification')
{
    emailext body: '''build is over

regards,
kalyan''', subject: 'build is over', to: 'kalyanvenkatnagasai@gmail.com'
}
}
