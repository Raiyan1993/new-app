# CICD-pipeline Setup

**Pre-requisite**

--> Install the SonarQube Scanner and Sonar Quality Gate Plugin

--> Configure SonarQube Server Credentials in Jenkins using the ID 'sonar-api'.

--> Configure AWS User Credentials in Jenkins using the IDs 'AWS_ACCESS_KEY_ID' and 'AWS_SECRET_ACCESS_KEY'.

--> Update the Environment Variables in the Jenkinsfile with your account details and region.
~~~  
        aws_account_id = '182011186910'
        region = 'ap-southeast-1'
~~~

1. Checkout Source Code
2. mvn clean package
3. mvn sonar:sonar -Dsonar.host.url="sonar-url" -Dsonar.login="token"
4. mvn install (deploy artifact to local maven repository)
5. Build Docker image
6. Scan docker image using trivy

   eg, trivy image "image_name"

7. Push docker image to ECR   

**Command to Start the SonarQube Server, if SQ didn't came up**

su -c '/home/sonarqube/sonarqube-9.9.1.69595/bin/linux-x86-64/sonar.sh start' sonarqube


