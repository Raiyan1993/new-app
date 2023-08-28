@Library('my-shared-library') _

pipeline {

    agent any

    parameters{
        choice(name: 'action', choices: 'Create\nDelete', description: 'Choose Create/Destroy')
        string(name: 'AppName', defaultValue: 'spring-boot-app', description: 'Name of the docker image in lower case')
    }

    stages {
        // stage("Git Checkout") {
        //     steps {
        //         script{
        //             gitCheckout(
        //                 branch: "master",
        //                 url: "https://github.com/Raiyan1993/new-app.git"
        //             )
        //         }
        //     }
        // }
        stage("Unit Test maven") {
          when { expression { params.action == 'Create' } }    
            steps {
                script{
                    mvnTest()
                }
            }
        }    
        stage("maven integrationTest") {
          when { expression { params.action == 'Create' } }     
            steps {
                script{
                    mvnIntergrationTest()
                }
            }
        } 
        stage("Static Code Analysis: SonarQube") {
          when { expression { params.action == 'Create' } }     
            steps {
                script{
                    def SonarQubeCreds = 'sonar-api'
                    StaticCodeAnalysis(SonarQubeCreds)
                }
            }
        }
        stage("Sonar Quality Gate Check") {
          when { expression { params.action == 'Create' } }     
            steps {
                script{
                    def SonarQubeCreds = 'sonar-api'
                    SonarQualityGate(SonarQubeCreds)
                }
            }
        }
        stage("Maven Build") {
          when { expression { params.action == 'Create' } }     
            steps {
                script{
                    mvnBuild()
                }
            }
        }
        stage("Docker Image Build") {
          when { expression { params.action == 'Create' } }     
            environment {
            //   AppName = 'mysec-app'
              DockerHubUser = 'raiyan'
            }
            steps {
                script{
                    def dockerImageTag = env.BUILD_NUMBER
                    BuildDocker(DockerHubUser, AppName, dockerImageTag)
                }
            }
        }
    }    
}
