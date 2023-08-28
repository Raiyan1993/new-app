@Library('my-shared-library') _

pipeline {
    agent any
    stages {
        stage("Git Checkout") {
            steps {
                script{
                    gitCheckout(
                        branch: "main",
                        url: "https://github.com/Raiyan1993/my-cicd-pipeline.git"
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
    }
}
