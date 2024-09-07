# Terraform

#### Terraform Basics & Core Concepts

#### Goal: Understand Terraform’s core concepts and get hands-on with basic infrastructure.
#### Learn:
#### What is Terraform and why IaC is important.
terraform is an infrastructure as a code IoC

lets you automate and manage your infrastructure , platform, service that run on platform  

it defines resource by human readable  configuration files declarative format

declarative mainly means desired state(what u want at the end)


#### Terraform architecture: providers, resources, modules, state, and execution plan.

#### Basic Terraform workflow (init, plan, apply, destroy).


Terraform configuration to launch an EC2 instance in AWS.

installing terraform

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

create key pair in aws instances (my-server-key)

copy key pair from windows(host) to ubuntu wsl (if you are using ubuntu subsystem)

```bash 
cp /mnt/c/users/prave/Downloads/my-server-key.pem ~/.ssh
```
check 
```bash
cd ~/.ssh
ls
```
check permissions 

```bash
ls -l ~/.ssh/my-server-key.pem
```
change permissions 

```bash
chmod 400 ~/.ssh/my-server-key.pem
```
generate id:rsa and id_rsa.pub  if not exist

```bash
ssh-keygen
```
create a resource for key pair 

key_name and public_key (file) 

create security group to allow ssh for instance 

you can always print output of the ec2 instance pupblice ip for easy to see ecw public ip in the terminal of the terraform 


create aws instance with ami image (i am using linux image here)

main arguments 

ami

instance_type

key_name

security groups 

tag 

connect to instance with ssh key

```bash
ssh ec2-user@<ec2-public_ip>
```


## git hub pushing troubleshoot 

```bash
git add .
git remote -v
git push --force origin main
git remote add origin https://github.com/Praveena0308/Terraform.git
git commit -m "Initial commit"
git push -u origin main
git fetch origin
 git rebase origin/main

git push -u origin main
git status
```
Remove the large File from Git History:
If the file was previously committed, use git filter-repo to remove it:
```bash
git filter-repo --path .terraform/providers/registry.terraform.io/hashicorp/aws/5.66.0/linux_amd64/terraform-provider-aws_v5.66.0_x5 --invert-paths
```