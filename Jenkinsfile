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
                       extensions: [[$class: 'RelativeTargetDirectory']]
                      ])


         }
   }


    stage('deploy project') {
        steps {

                    sh 'pwd'
                    sh "aws cloudformation  create-stack --stack-name ${params.stackname} --region us-east-1 --template-body file://webAppTemp.json"
                    sh "aws cloudformation wait stack-create-complete --region us-east-1 --stack-name ${params.stackname}"






        }
    }
}






}


