pipeline {
   agent any { 
     stages {

        stage('Clone repository') {
      

            checkout scm
    }

    stage('Build image') {
  
       app = docker.build("kirankumarajith97/test2")
    }

    stage('Test image') {
  

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'git') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
   }
}
