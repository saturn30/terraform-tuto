terraform init
terraform plan -target=local_file.kube_config
terraform apply -target=local_file.kube_config --auto-approve

sleep 10
terraform apply  --auto-approve
