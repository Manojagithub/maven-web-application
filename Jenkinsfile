def build_Number = BUILD_NUMBER
pipeline{
agent any
tools{
maven "maven3.8.5"
}
parameters {
  string(name: "JAVA_VERSION", defaultValue: "1.8.0", description: "Java Version")
  string(name: "TOMCAT_MAJOR_VERSION", defaultValue: "8", description: "Tomcat Major Version")
  string(name: "TOMCAT_VERSION", defaultValue: "8.5.79", description: "Tomcat Version")
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
        script {
          print("build_Number " + build_Number)
          sh "docker build -t manojadockerhub/maven-web-application:$build_Number --build-arg JAVA_VER=${params.JAVA_VERSION}  --build-arg TOMCAT_MAJOR_VER=${params.TOMCAT_MAJOR_VERSION} --build-arg=TOMCAT_VER=${params.TOMCAT_VERSION} ."
        }
      }
    }
stage('Docker Push') {
steps{
 withCredentials([string(credentialsId: 'DockerHubPwd', variable: 'DockerHubPwd')]) {
 sh " docker login -u manojadockerhub -p ${DockerHubPwd}"
}
  sh " docker push manojadockerhub/maven-web-application:${params.TOMCAT_VERSION}-${build_Number} "
}
}
}
}
