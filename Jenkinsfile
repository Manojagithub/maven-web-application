def build_Number = ${BUILD_NUMBER}
pipeline{
agent any
tools{
maven "maven3.8.5"
}
stages{
stage('CheckoutCode'){
steps{
git credentialsId: 'fe7eb12e-cbb3-4b9a-b899-10e61de20b96', url: 'https://github.com/Manojagithub/maven-web-application.git'
}
}
stage('Build'){
steps{
sh "mvn clean package"
}
}
stage('Docker Build') {
      steps {
        sh 'docker build -t manojadockerhub/maven-web-application:${buid_Number} .'
      }
    }
stage('Docker Push') {
steps{
 withCredentials([string(credentialsId: 'DockerHubPwd', variable: 'DockerHubPwd')]) {
 sh " docker login -u manojadockerhub -p ${DockerHubPwd}"
}
  sh " docker push manojadockerhub/maven-web-application:${build_Number} "
}
}
}
}
