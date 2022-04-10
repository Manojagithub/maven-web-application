node{
 
 def mavenHome = tool name: "maven3.8.5"
 properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])
 
 stage('CheckoutCode'){
    git branch: 'development', credentialsId: '21a9646b-21c0-4d63-afa2-946130d09406', url: 'https://github.com/Manojagithub/maven-web-application.git'
   }
   stage('Build'){
   sh "${mavenHome}/bin/mvn clean package"
 }
 
 stage('ExecuteSonarQubeReport')
 {
    sh "${mavenHome}/bin/mvn sonar:sonar" 
 }
 stage('UploadArtifactIntoNexus')
 {
    sh "${mavenHome}/bin/mvn deploy"  
 }
 stage('DeployAppIntoTomcatserver')
 {
     sshagent(['217b0457-42ac-4916-b3d1-bc1e4b7edd9b']) {
     sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.110.77.110:/opt/apache-tomcat-9.0.60/webapps/"

}
 
 }
 stage('SendEmailNotification')
 {
    emailext body: '''pipeline project Build is over

Regards,
Manu''', subject: 'Build over!', to: 'manu.audireddy@gmail.com' 
 }

 
 
 }
