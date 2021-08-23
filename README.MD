Load aws credentials (aws cli)
Load google credentials (google sdk)

terraform init -backend-config=./tfvars/init.tfvars 
terraform apply -var-file ./tfvars/apply.tfvars

Then go to namecheap and point the instance output to the new IP

TODO:
Configure namecheap provider to autopoint to new ip