# Terraform & Ansible EC2 Nginx

## Project Overview
This project provisions an AWS EC2 instance using **Terraform** and configures it using **Ansible** to install and run **Nginx**.  
It demonstrates a real-world workflow of Infrastructure as Code (IaC) and configuration management, combining Terraform and Ansible.

## Architecture
- Terraform: Creates EC2 instance + Security Group
- Ansible: Connects to EC2 via SSH and installs/configures Nginx
- End Result: Nginx web server accessible via browser

```

[Browser] --> [EC2 Instance (Nginx)] <-- Terraform + Ansible

````

## Prerequisites
- AWS account
- Terraform installed
- Ansible installed
- SSH key pair for EC2 access
- Browser to test Nginx

## How to Run Terraform
```bash
cd terraform
terraform init
terraform plan
terraform apply
````

* Note the **public IP** output after apply.

## How to Run Ansible

```bash
cd ansible
ansible-playbook -i inventory/hosts.yml playbooks/nginx.yml
```

* Ensure `hosts.yml` contains the EC2 public IP.

## How to Test Nginx

* Open a browser and navigate to:
  `http://<EC2_PUBLIC_IP>`
* You should see the **Nginx welcome page**.

## Cleanup Instructions

```bash
cd terraform
terraform destroy
```
* This will remove the EC2 instance and all related resources.


