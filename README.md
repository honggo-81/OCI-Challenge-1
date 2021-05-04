OCI-Challenge-1

Write the terraform scripts that is able to provision an environment similar to diagram below.
Take note of the following:
1. Not all components are in the diagram, use your own experience / initiative to find out 
   what else needs to be in the environment for it to work. E.g., Subnets are not in the diagram.
2. App Server is only accessible via port 8080 from the Load Balancer, and 22 from the bastion 
   compute. Plan your network boundaries properly to ensure there is sufficient level of security.
3. The diagram leverages on the always free resources available on Oracle Cloud. (2x compute, LB)   

There are tasks that need to be done as part of provisioning
1. Install JDK8 on the App Server compute
2. Install Docker engine on the App Server compute

![alt text](https://github.com/honggo-81/OCI-Challenge-1/blob/main/environment.png?raw=true)

Pre-requisites
1. Oracle Cloud Infrastructure account
2. Terraform
3. Windows Subsystem for Linux (Optional)

Build steps
1. terraform init
2. terraform plan
3. terraform apply