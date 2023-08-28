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
    }
}
