
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

15. Add another resource to main.tf file
    yandex_vpc_network and yandex_vpc_subnet
16. Change subnet_id in main resource
    yandex_vpc_subnet.app-subnet.id
17. Recreate resource and notice resource creation order. 
Now subnet must be created before compute instance
    output :
    yandex_vpc_network.app-network: Creating...
    yandex_vpc_network.app-network: Creation complete after 1s [id=enpjreikev5t177qrtb7]
    yandex_vpc_subnet.app-subnet: Creating...
    yandex_vpc_subnet.app-subnet: Creation complete after 1s [id=e9b91dc4efd7ghd6kmho]
    yandex_compute_instance.app: Creating...
18. create new image with packer
    reddit-base-1626211450  (fd8ohpo3sd3mr1rpd4rt) - app.json
    reddit-base-1626211026 (fd859t2fn12kpkq2hamg) - db.json
    
19. create two terraform configuration
    app.tf
    db.tf
    separate vpc.tf configuration
    add new ip (db) to outputs
    
20. create new 2 instances 
    terraform apply
    Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
Outputs:
external_ip_address_app = 193.32.219.89
external_ip_address_db = 193.32.218.95

21. use module instead simple separate files
terraform/modules/db
terraform/modules/app

22. add modules in main file, use module block and terraform get  command to init modules
check that modules initialized
    cat .terraform/modules/modules.json
    output -
    {"Modules":[{"Key":"","Source":"","Dir":"."},{"Key":"app","Source":"./modules/app","Dir":"modules/app"},
    {"Key":"db","Source":"./modules/db","Dir":"modules/db"}]}
    
23. subnet_id moved to variable (e9b94uuh3jgme9qok7vc) and created by hand
24. create vm using modules
    external_ip_address_app = 193.32.219.97
    external_ip_address_db = 178.154.241.29
    
25. try to connect 
ssh ubuntu@193.32.219.97
ssh ubuntu@178.154.241.29
    
26. create prod and stage forlder with configuration for run modules for different environment



    
