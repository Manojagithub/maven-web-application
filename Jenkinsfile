pipeline{
agent {
label 'node1'
}
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

}
}
