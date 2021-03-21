pipeline {
  triggers {
    pollSCM('') // Enabling being build on Push
  }
  agent any
  stages {
    stage('Render PDFs') {
      steps {
        // script {
        //   docker.build("my-image").withRun('-p 5000:5000', '--shm-size=1g')
        // }
        sh 'docker build -t my-image .'
        sh 'docker run -d -p 5000:5000 --shm-size=1g my-image --name="drawio"'
        sh 'sh ./generate_pdfs.sh'
        sh 'docker kill drawio'
        sh 'docker system prune -f'
      }
    }
    stage('Push PDFs') {
      steps { 
          withCredentials([string(credentialsId: 'GITHUB_PAGES_TOKEN', variable: 'GH_TOKEN')]) {
            sh 'git add .'
            sh "git -c user.name='wms2537' -c user.email='swmeng@yes.my' commit -m 'update pdfs'" 
            sh "git -c user.name='wms2537' -c user.email='swmeng@yes.my' push https://wms2537:${GH_TOKEN}@github.com/wms2537/uec_physics.git "
            // sh 'npm run deploy -- --repo=https://github.com/wms2537/wms2537.github.io.git --name="wms2537" --email=swmeng@yes.my' 
          }
        }
    }
  }
}