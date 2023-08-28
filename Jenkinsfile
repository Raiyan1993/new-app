@Library('my-shared-library') _

pipeline {
    agent any
    stages {
        stage("Git Checkout") {
            steps {
                script{
                    gitCheckout(
                        branch: "master",
                        url: "https://github.com/Raiyan1993/new-app.git"
                    )
                }
            }
        }
        stage("Unit Test maven") {
            steps {
                script{
                    mvnTest()
                }
            }
        }    
        stage("maven integrationTest") {
            steps {
                script{
                    mvnIntergrationTest()
                }
            }
        } 
        stage("Static Code Analysis: SonarQube") {
            steps {
                script{
                    def SonarQubeCreds = 'sonar-api'
                    StaticCodeAnalysis(SonarQubeCreds)
                }
            }
        }
        stage("Sonar Quality Gate Check") {
            steps {
                script{
                    def SonarQubeCreds = 'sonar-api'
                    SonarQualityGate(SonarQubeCreds)
                }
            }
        }
        stage("Maven Build") {
            steps {
                script{
                    mvnBuild()
                }
            }
        }
        stage("Docker Image Build") {
            environment {
              AppName = 'mysec-app'
              ImageTag = env.BUILD_NUMBER
              DockerHubUser = 'raiyan'

            steps {
                script{
                    BuildDocker(AppName, ImageTag, DockerHubUser)
                }
            }
        }  
    }
}
