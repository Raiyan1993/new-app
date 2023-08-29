@Library('my-shared-library') _

pipeline {

    agent any

    parameters{
        choice(name: 'action', choices: 'Create\nDelete', description: 'Choose Create/Destroy')
        string(name: 'AppName', defaultValue: 'spring-boot-app', description: 'Name of the docker image in lower case')
    }

    environment {
        DockerHubUser = 'raiyan'
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
            // environment {
            //   DockerHubUser = 'raiyan'
            // }
            steps {
                script{
                    def dockerImageTag = env.BUILD_NUMBER
                    BuildDocker(env.DockerHubUser, AppName, dockerImageTag)
                }
            }
        }
        stage("Docker Image Scan: Trivy") {
          when { expression { params.action == 'Create' } }
            steps {
                script{
                    def dockerImageTag = env.BUILD_NUMBER
                    DockerImageScan(env.DockerHubUser, AppName, dockerImageTag)
                }
            }
        }
    }    
}
