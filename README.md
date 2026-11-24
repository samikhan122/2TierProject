🚀 AWS 2-Tier Infrastructure Project Using Terraform
📌 Project Overview
This project demonstrates the deployment of AWS infrastructure using Terraform (Infrastructure as Code).
The infrastructure provisions an AWS Virtual Private Cloud (VPC) with two public subnets across different Availability Zones, two EC2 web server instances, and an Application Load Balancer (ALB) to distribute incoming HTTP traffic between the servers.
The project focuses on infrastructure automation, AWS networking, load balancing, and high availability.

🏗️ Architecture

The project includes the following AWS resources:
Amazon VPC: Custom VPC for isolated networking.
Public Subnets: Two public subnets deployed across separate Availability Zones.
Internet Gateway: Provides internet connectivity.
Route Table: Routes internet-bound traffic through the Internet Gateway.
Security Groups: Controls inbound and outbound network traffic.
Amazon EC2: Two web server instances deployed in separate subnets.
Application Load Balancer: Distributes incoming HTTP requests.
Target Group: Registers both EC2 instances as targets.
Health Checks: Monitors the availability of registered instances.
Amazon S3: Creates an S3 bucket using Terraform.

🛠️ Technologies Used
Technology	Purpose
AWS	Cloud Infrastructure
Terraform	Infrastructure as Code
Amazon VPC	Network Isolation
EC2	Web Server Hosting
Application Load Balancer	Traffic Distribution
Security Groups	Network Security
Amazon S3	Object Storage
Linux	Server Administration
Shell Scripting	User Data Automation
Git & GitHub	Version Control
📂 Project Structure
text
2TierProject/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── userdata1.sh
├── userdata2.sh
└── README.md


Note: Adjust the file structure according to the actual files in your repository.
⚙️ Infrastructure Workflow
Configure the AWS provider and Terraform variables.
Create a custom AWS VPC.
Create two public subnets in separate Availability Zones.
Attach an Internet Gateway to the VPC.
Configure route tables and subnet associations.
Create Security Groups for web traffic.
Launch two EC2 instances with automated user-data scripts.
Create an Application Load Balancer.
Configure the Target Group and register both EC2 instances.
Configure the ALB listener on HTTP port 80.
Deploy the infrastructure using Terraform.
Access the application through the Load Balancer DNS endpoint.

🚀 Deployment Instructions
Prerequisites
The Application Load Balancer will distribute incoming requests between the two EC2 web servers.

📸 Project Screenshots
Web Server 1
The first EC2 instance displays its customized web page.

Web Server 2
The second EC2 instance displays a different customized web page.

Application Load Balancer
Both instances are registered with the Target Group to receive incoming traffic through the ALB.

🎯 Key Learning Outcomes
Through this project, I gained practical experience with:

AWS infrastructure provisioning using Terraform.
Building custom VPC networking.
Deploying resources across multiple Availability Zones.
Configuring public subnets and internet connectivity.
Automating EC2 configuration using user-data scripts.
Implementing Application Load Balancing.
Configuring Target Groups and Health Checks.
Managing Terraform resource dependencies.
Using Terraform variables and outputs.
🔐 Security Considerations

For production deployments, the following improvements are recommended:
Restrict SSH access to trusted IP addresses.
Use separate Security Groups for the ALB and EC2 instances.
Allow HTTP traffic to EC2 instances only from the ALB Security Group.
Use private subnets for application servers where appropriate.
Store sensitive information securely.
Enable HTTPS using an SSL/TLS certificate.
Enable appropriate monitoring and logging.
🧹 Cleanup
To avoid unnecessary AWS charges, destroy the infrastructure when it is no longer needed:
bash
terraform destroy
Review the resources before confirming deletion.

Note: The S3 bucket may need to be emptied before Terraform can delete it.
👨‍💻 Author
Ali Khan
Cloud & DevOps Enthusiast | AWS | Terraform | Linux | Infrastructure as Code

Building practical cloud infrastructure projects and continuously improving my DevOps engineering skills.

⭐ If you find this project useful, feel free to star the repository!

#AWS #Terraform #DevOps #CloudComputing #InfrastructureAsCode
