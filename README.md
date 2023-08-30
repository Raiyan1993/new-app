# CICD-pipeline Setup

**Pre-requisite:**

--> Install the SonarQube Scanner and Sonar Quality Gate Plugin.

--> Configure SonarQube Server Credentials in Jenkins using the ID 'sonar-api'.

--> Configure AWS User Credentials in Jenkins using the IDs 'AWS_ACCESS_KEY_ID' and 'AWS_SECRET_ACCESS_KEY'.

--> Update the Environment Variables in the Jenkinsfile with your account ID and region.
~~~  
aws_account_id = '182011186910'
region = 'ap-southeast-1'
~~~

**Here are the Jenkins stages:**

1. Check out the Source Code
2. Execute: 'mvn clean package'
3. Perform the Sonar analysis 
~~~
Run: mvn sonar:sonar -Dsonar.host.url='sonar-url' -Dsonar.login='token'
~~~
4. Execute: mvn install (to deploy the artifact to the local Maven repository)
5. Build the Docker Image
6. Scan the Docker Image using Trivy
~~~
trivy image "image_name"
~~~
7. Push the Docker Image to ECR

**Note:**
Command to Start the SonarQube Server, if SQ didn't came up
~~~
su -c '/home/sonarqube/sonarqube-9.9.1.69595/bin/linux-x86-64/sonar.sh start' sonarqube
~~~


