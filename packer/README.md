# panthrashkov_infra
panthrashkov Infra repository

# Сборка образов VM при помощи Packer

Создание сервисного аккаунта в yandex cloud
Get folder id
```bash
yc config list
```
b1gaeis0eu1b5lcjtuts
```bash
SVC_ACCT="panthrashkov-service-account"
FOLDER_ID="b1gaeis0eu1b5lcjtuts"
yc iam service-account create --name $SVC_ACCT --folder-id $FOLDER_ID
```
output -
id: aje1erpvttugl69lbbpu
folder_id: b1gaeis0eu1b5lcjtuts
created_at: "2021-07-03T19:54:55.920780828Z"
name: panthrashkov-service-account

add grants to account
```bash
ACCT_ID=$(yc iam service-account get $SVC_ACCT | grep ^id | awk '{print $2}')
yc resource-manager folder add-access-binding --id $FOLDER_ID --role editor  --service-account-id $ACCT_ID
```
save service-account credentials
```bash
CREDENTIALS_PATH=/home/alex/IdeaProjects/infra-secret
yc iam key create --service-account-id $ACCT_ID --output $CREDENTIALS_PATH/key.json
```
create ubuntu16.json
copy content
validate json (from packer dir)
```bash
packer validate ./ubuntu16.json
packer validate -var-file=variables.json ./ubuntu16.json
```
run build packer
```bash
packer build ./ubuntu16.json
packer build -var-file=variables.json ./ubuntu16.json 
```
A disk image was created: reddit-base-1625519544 (id: fd8tebi6g8d7k8u46mj5) with family name reddit-base

create VM
connect to it
```bash
ssh -i ~/.ssh/appuser appuser@84.201.143.119    
```
```bash
install reddit
sudo apt-get update
sudo apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
```
