pipeline{

agent{

    node {
        label 'aws-linux-slave'
    }
}

options {
   timestamps()


}


    parameters{
      string(
        defaultValue: 'us-east-1',
        description: 'region',
        name: 'region'
      )
      string(
        description: 'regex to build emulators',
        name: 'stackname'
      )
    }


stages {

    stage('CleanWorkspace') {
        steps {
            cleanWs()
        }
    }

   stage('checkout repositories') {

         steps {


                  checkout([$class: 'GitSCM', branches: [[name: '*/master']],
                      userRemoteConfigs: [[url: 'git@github.com:Fadih/mywebapp.git']],
                       extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'mywebapp']]
                      ])


         }
   }


    stage('deploy project') {
        steps {

             dir ('mywebapp') {
                    sh 'pwd'
                    sh 'aws cloudformation  create-stack --stack-name ${params.stackname} --region ${params.region} --template-body file://webAppTemp.json'
                    sh 'aws cloudformation wait stack-create-complete --region ${params.region} --stack-name ${params.stackname}'




                }



        }
    }



    stage('call deploy job') {
        steps {

    build job: 'appiumVersion-for-emulators-puppet-deploy', parameters: [[$class: 'StringParameterValue', name: 'appiumVersion', value: "${params.appiumVersionsList}"]]

        }
    }





}


post {
     always {

       archiveArtifacts artifacts: 'emulator-container/images/images.txt', onlyIfSuccessful: false

     }




}





}


