# CICD-pipeline steps

1. Checkout Source Code
2. mvn clean package
3. mvn sonar:sonar -Dsonar.host.url=<sonar-url> -Dsonar.login=<token>
4. mvn install (deploy artifact to local maven repository)
5. Build Docker image
6. Scan docker image using trivy

**trivy image <image_name>**