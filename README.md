# my-cicd-pipeline steps

1. Checkout Source Code
2. mvn clean package
3. mvn sonar:sonar -Dsonar.host.url=<sonar-url> -Dsonar.login=<token>