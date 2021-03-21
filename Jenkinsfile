pipeline {
  triggers {
    pollSCM('') // Enabling being build on Push
  }
  agent any
  stages {
    stage('Render PDFs') {
      steps {
        sh 'sh ./generate_pdfs.sh'
      }
    }
    stage('Push PDFs') {
      steps { 
          withCredentials([string(credentialsId: 'GITHUB_PAGES_TOKEN', variable: 'GH_TOKEN')]) {
            sh 'ls'
            sh 'ls ./out'
            sh 'git add --all'
            sh "git -c user.name='wms2537' -c user.email='swmeng@yes.my' status"
            sh "git -c user.name='wms2537' -c user.email='swmeng@yes.my' commit -m 'update pdfs'" 
            sh "git -c user.name='wms2537' -c user.email='swmeng@yes.my' push https://wms2537:${GH_TOKEN}@github.com/wms2537/uec_physics.git "
            // sh 'npm run deploy -- --repo=https://github.com/wms2537/wms2537.github.io.git --name="wms2537" --email=swmeng@yes.my' 
          }
        }
    }
  }
}