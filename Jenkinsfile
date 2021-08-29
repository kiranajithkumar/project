node {
    def app

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
     stage('Deploy image') {
         def dockerRun = 'docker run -p 8080:8080 -d --name project kirankumarajith97/test2' 
         sshagent(['production-server']) {
            sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.21.196 ${dockerRun}"
    
         }
     }
}
}
