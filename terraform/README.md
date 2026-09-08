# Manara Recipes — Terraform Deployment Guide

This directory contains Terraform configuration used to deploy the Manara Recipes demonstration application on AWS. The guide below is written for reviewers and maintainers — concise, step-by-step, and suitable for submission to Manara.

## 📋 Prerequisites

1. **AWS Account** - You need an active AWS account
2. **AWS CLI** - Install and configure with your credentials
3. **Terraform** - Install Terraform (version 1.0 or later)
4. **EC2 Key Pair** - Create a key pair in the AWS Console

## 🚀 Quick Start

### Step 1: Configure AWS Credentials
```bash
aws configure
# Enter your AWS Access Key ID, Secret Key, and preferred region
```

### Step 2: Prepare Terraform Variables
```bash
# Copy the example variables file
cp terraform.tfvars.example terraform.tfvars

# Edit the file with your preferences
nano terraform.tfvars
```

### Step 3: Initialize Terraform
```bash
terraform init
```

### Step 4: Plan the Deployment
```bash
terraform plan
```

### Step 5: Deploy the Infrastructure
```bash
terraform apply
# Type 'yes' when prompted
```

## 🏗️ What Gets Created

- **VPC** — Private network for the application
- **Subnets** — Public and private network segments
- **Internet Gateway** — Internet access for public subnets
- **Application Load Balancer** — Distributes traffic across instances
- **Auto Scaling Group** — Automatically manages EC2 instances
- **Security Groups** — Firewall rules controlling inbound/outbound access

## 🔧 Configuration Options

### Environment Sizes

| Environment | Instance Type | Min Instances | Max Instances |
|-------------|---------------|---------------|---------------|
| dev         | t3.micro      | 1             | 2             |
| staging     | t3.small      | 1             | 3             |
| prod        | t3.medium     | 2             | 6             |

### Customization

Edit `terraform.tfvars` to customize:
- AWS region
- Environment name (dev/staging/prod)
- Application name
- Domain name (optional)

## 📊 Monitoring

After deployment, you can monitor your application:
- AWS CloudWatch for metrics and logs
- Load balancer health checks
- Auto scaling events

## 🔒 Security Notes

⚠️ **Important Security Considerations:**

1. **SSH Access** - The current configuration allows SSH from anywhere (0.0.0.0/0). In production, restrict this to your IP address.

2. **Key Pair** - Make sure to:
   - Create an EC2 key pair in the AWS Console
   - Update the `key_name` in `main.tf`
   - Keep your private key file secure

3. **HTTPS** - For production, add SSL/TLS certificate to the load balancer

## 🧹 Cleanup

To destroy all created resources:
```bash
terraform destroy
# Type 'yes' when prompted
```

## 📁 File Structure

```
terraform/
├── main.tf                    # Main Terraform configuration
├── user-data.sh               # EC2 initialization script
├── terraform.tfvars.example   # Example variables file
└── README.md                  # This file
```

## 🆘 Troubleshooting

### Common Issues

1. **Permission Denied**
   - Ensure your AWS credentials have the necessary permissions
   - Check that you're using the correct AWS region

2. **Key Pair Not Found**
   - Create an EC2 key pair in the AWS Console
   - Update the `key_name` in `main.tf`

3. **Health Check Failures**
   - Check the EC2 instance logs: `/var/log/user-data.log`
   - Verify the application is running: `systemctl status recipe-app`

4. **Cannot Access Application**
   - Wait 5-10 minutes for instances to fully initialize
   - Check the load balancer target group health
   - Verify security group rules

### Useful Commands

```bash
# Check Terraform state
terraform show

# List all resources
terraform state list

# Get output values
terraform output

# Refresh state
terraform refresh
```

## 💡 Tips

- Start with the `dev` environment for testing and validation
- Review IAM permissions before running apply in production
- Monitor AWS costs during and after deployment
- Always run `terraform plan` and review changes before `terraform apply`

## Submission note

This Terraform configuration is included as part of the Manara SAA project submission. It is intended for demonstration and learning; adjust resource sizes and networking rules before using in production.
