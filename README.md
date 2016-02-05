# terraform-consul-example

Ready to go Consul cluster. From https://medium.com/@spinx/terraforming-aws-setting-up-highly-available-consul-cluster-in-less-than-5min-d1a2524e5882#.t9q20zjey

### Dependencies
* Terraform: https://terraform.io/downloads.html
* AWS CLI: http://docs.aws.amazon.com/cli/latest/userguide/installing.html
* Ansible: http://docs.ansible.com/intro_installation.html

### Pull dependencies
```
make
ansible-galaxy install -r requirements.yml
```

### Setup
* Modify credentials.tf with your AWS and Atlas keys. Make sure you don't push this to GitHub!!
* Add key pair to AWS EC2 and modify key_name in credentials.tf
* Modify security_groups.tf where commented DANGER with your IP. If you don't do this, your cluster will be publicly accessible and very insecure!


### Run 
* _terraform plan_ to see what TF will do
* _terraform apply_ to set up the cluster

### Output 
When TF is finished you will get the list of servers that were set up and a Consul Web UI URL. 

### Troubleshooting
If your AWS account supports EC2 Classic, this won't work for you. You need to specify VPC and Subnet ids to launch the servers in VPC. See here: https://gist.github.com/spinx/047afb19996b91795dd5
