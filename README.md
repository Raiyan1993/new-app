# CICD-pipeline steps

1. Checkout Source Code
2. mvn clean package
3. mvn sonar:sonar -Dsonar.host.url="sonar-url" -Dsonar.login="token"
4. mvn install (deploy artifact to local maven repository)
5. Build Docker image
6. Scan docker image using trivy

   eg, trivy image "image_name"

**Command to Start the SonarQube, if SQ didn't came up**
su -c '/home/sonarqube/sonarqube-9.9.1.69595/bin/linux-x86-64/sonar.sh start' sonarqube