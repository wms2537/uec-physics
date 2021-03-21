pipeline {
  triggers {
    pollSCM('') // Enabling being build on Push
  }
  agent { dockerfile {
      args '-v --shm-size=1g'
  } }
  stages {
    stage('Render PDFs') {
      steps {
        sh 'pwd'
        sh 'ls'
        sh 'sh ./generate_pdfs.sh'
      }
    }
    stage('Push PDFs') {
      steps { 
          withCredentials([string(credentialsId: 'GITHUB_PAGES_TOKEN', variable: 'GH_TOKEN')]) {
            sh 'git add .'
            sh "git commit -m 'update pdfs'" 
            sh 'git push https://wms2537:${GH_TOKEN}@github.com/wms2537/uec_physics.git '
            // sh 'npm run deploy -- --repo=https://github.com/wms2537/wms2537.github.io.git --name="wms2537" --email=swmeng@yes.my' 
          }
        }
    }
  }
}