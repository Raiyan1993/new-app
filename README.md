# CICD-pipeline Setup

**Pre-requisite:**

--> Utilize the following Terraform code to create an EC2 instance and install the necessary tools: [Terraform GitHub Repository](https://github.com/Raiyan1993/terraform/tree/master/jenkins-project).

--> Install the SonarQube Scanner and the Sonar Quality Gate Plugin within Jenkins.

--> Configure SonarQube Server Credentials in Jenkins using the ID 'sonar-api'.

--> Configure AWS User Credentials in Jenkins using the IDs 'AWS_ACCESS_KEY_ID' and 'AWS_SECRET_ACCESS_KEY'.

--> Update the Environment Variables in the Jenkinsfile with your account ID and region.
~~~  
aws_account_id = '182011186910'
region = 'ap-southeast-1'
~~~

--> configure the shared library in Jenkins under 'Manage Jenkins' > 'Configure System' with named "my-shared-library"(without the quotes).

Note: Once you've done this, the shared library named "my-shared-library" will be configured and available for use in your Jenkins pipelines.

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
Command to start the SonarQube Server if SQ didn't come up.
~~~
su -c '/home/sonarqube/sonarqube-9.9.1.69595/bin/linux-x86-64/sonar.sh start' sonarqube
~~~


