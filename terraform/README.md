
# Практика IaC с использованием Terraform

1. Install terraform version 0.12.8
   https://releases.hashicorp.com/terraform/0.12.8/terraform_0.12.8_linux_amd64.zip

2. fill main.tf
fill yandex provider (version 0.35)
get config and get images   
```bash
yc config list  
yc compute image list
```   
3. Init terraform in folder terraform
```bash
terraform init
```
4. fill resource
5. planing changes
```bash
terraform plan
```
6. run vm
```bash
terraform apply
```
7. instance create
8. use terraform show
```bash
terraform show | grep nat_ip_address
```
9. Add ssh key
10. 
```bash
ssh ubuntu@178.154.205.112
```
11. create outputs.tf
refresh vm for get id
```bash
terraform refresh
``` 
output - external_ip_address_app = 178.154.205.112
12. mark vm to recreate on next change, plan an apply
```bash
terraform taint yandex_compute_instance.app
terraform plan
terraform apply
```
VM created
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
Outputs:
external_ip_address_app = 84.201.172.100

13. Use variables.tf to declare user variables. Use them into main.tf
14. User terraform.tfvars to fill declared variables.
