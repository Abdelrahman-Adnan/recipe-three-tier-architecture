# 🌟 Manara Recipes — Cloud-Native Recipe Sharing

[![AWS](https://img.shields.io/badge/AWS-100000?style=for-the-badge&logo=amazon-aws&logoColor=white&color=FF9900)](https://aws.amazon.com/)
[![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)](https://reactjs.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)](https://fastapi.tiangolo.com/)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)

## 🙏 Acknowledgments

Special thanks to **Manara** for providing this amazing opportunity to learn and implement AWS solutions through the SAA learning path.

Huge appreciation to the instructors, mentors, and the Manara team for their guidance throughout this AWS journey.

---

## 📖 Project Overview

A comprehensive **cloud-native recipe sharing platform** built with modern web technologies and deployed on AWS infrastructure. This project demonstrates real-world application of AWS services including serverless computing, content delivery, database management, and infrastructure as code.

### 🎯 Learning Objectives
- Master AWS core services and their practical applications 🎓
- Implement Infrastructure as Code using CloudFormation ⚙️
- Build scalable three-tier architecture on AWS 🏗️
- Practice CI/CD deployment strategies 🚀
- Understand AWS security best practices 🔐

---

## 📁 Project Structure

```
aws-recipe-sharing-app/
├── 📁 backend/                    # FastAPI Backend Services
│   ├── main.py                   # Core application logic & API endpoints
│   ├── requirements.txt          # Python dependencies
│   └── .env                      # Environment variables (local)
├── 📁 frontend/                   # React Frontend Application
│   ├── 📁 src/                   # Source code directory
│   │   ├── App.tsx              # Main React component
│   │   ├── App.css              # Application styles
│   │   ├── api.ts               # API service layer
│   │   ├── 📁 components/       # Reusable UI components
│   │   │   ├── RecipeCard.tsx   # Recipe display component
│   │   │   └── RecipeModal.tsx  # Recipe detail modal
│   │   ├── 📁 pages/            # Application pages
│   │   │   ├── HomePage/        # Main landing page
│   │   │   ├── AdminPage/       # Admin dashboard
│   │   │   └── UsersPage/       # User management
│   │   ├── 📁 types/            # TypeScript type definitions
│   │   ├── 📁 utils/            # Utility functions
│   │   └── 📁 assets/           # Static assets (images, icons)
│   │       ├── 📁 images/       # Application images
│   │       └── 📁 icons/        # SVG icons
│   ├── package.json             # Node.js dependencies
│   ├── tsconfig.json            # TypeScript configuration
│   └── vite.config.ts           # Vite build configuration
├── 📁 platform/                  # Infrastructure as Code
│   └── cloudformation.yaml     # AWS CloudFormation template (639 lines)
├── 📁 terraform/                 # Alternative IaC with Terraform
│   ├── main.tf                  # Terraform configuration
│   ├── terraform.tfvars.example # Example variables
│   └── user-data.sh             # EC2 initialization script
├── 📁 images/                    # Documentation assets
│   └── aws_architecture.png    # Architecture diagram
├── docker-compose.yml           # Local development environment
├── Dockerfile                   # Container configuration
├── requirements.txt             # Root Python dependencies
└── README.md                    # Project documentation
```

---

## 🏗️ AWS Architecture Overview

![AWS Architecture](./images/aws_manara_project_final_architecture.png)

The application follows a **three-tier architecture** pattern with high availability and scalability:

### 🌐 **Presentation Tier (Frontend)**
- **S3 Static Website Hosting** 📦 - Hosts React.js single-page application
- **CloudFront CDN** 🌍 - Global content delivery with edge caching
- **Route 53 DNS** 🔗 - Domain name resolution and traffic routing

### ⚡ **Application Tier (Backend)**
- **Application Load Balancer** ⚖️ - Distributes traffic across multiple instances
- **EC2 Auto Scaling Group** 📈 - Automatic scaling based on demand
- **VPC with Public/Private Subnets** 🔐 - Secure network isolation
- **NAT Gateway** 🌐 - Secure outbound internet access for private subnets

### 🗄️ **Data Tier (Database)**
- **DynamoDB** 📊 - NoSQL database with global secondary indexes
- **Point-in-Time Recovery** 🔄 - Automated backup and restore capabilities
- **IAM Roles & Policies** 🛡️ - Least privilege access control

---

## 🛠️ Technology Stack

### **🎨 Frontend Technologies**
| Technology | Purpose | Benefits |
|------------|---------|----------|
| **React.js 18** | UI Library | Modern hooks, component-based architecture |
| **TypeScript** | Type Safety | Compile-time error checking, better IDE support |
| **Vite** | Build Tool | Fast HMR, optimized bundling, modern ES modules |
| **CSS3 + Glassmorphism** | Styling | Modern visual effects, responsive design |

### **⚙️ Backend Technologies**
| Technology | Purpose | Benefits |
|------------|---------|----------|
| **FastAPI** | Web Framework | High performance, automatic API docs, async support |
| **Pydantic** | Data Validation | Type validation, serialization, settings management |
| **Uvicorn** | ASGI Server | Production-ready, async request handling |
| **Python 3.10+** | Runtime | Modern syntax, performance improvements |

### **☁️ AWS Cloud Services**
| Service | Tier | Purpose | Configuration |
|---------|------|---------|-------------|
| **S3** | Presentation | Static hosting | Public read access, website configuration |
| **CloudFront** | Presentation | CDN | HTTPS redirect, custom error pages |
| **EC2** | Application | Compute | t3.micro instances, user data scripts |
| **ALB** | Application | Load balancing | Health checks, target groups |
| **Auto Scaling** | Application | Scaling | CPU-based policies, min/max instances |
| **DynamoDB** | Data | Database | On-demand billing, GSI for queries |
| **VPC** | Network | Isolation | CIDR 10.0.0.0/16, multi-AZ subnets |
| **IAM** | Security | Access control | Least privilege roles and policies |

### **🔧 DevOps & Development Tools**
| Tool | Purpose | Configuration |
|------|---------|-------------|
| **Docker** | Containerization | Multi-stage builds, optimized images |
| **Docker Compose** | Local Development | Service orchestration, volume mapping |
| **CloudFormation** | Infrastructure as Code | 639-line template, parameterized |
| **AWS CLI** | Cloud Management | Programmatic AWS access |

---

## ☁️ CloudFormation Infrastructure Deep Dive

The **639-line CloudFormation template** (`platform/cloudformation.yaml`) implements a complete production-ready infrastructure following AWS Well-Architected Framework principles:

### 📋 **Template Parameters**
```yaml
Parameters:
  EnvironmentName: String        # Environment identifier (dev/staging/prod)
  DomainName: String            # Custom domain for the application
  CertificateArn: String        # SSL certificate for HTTPS
  KeyPairName: String           # EC2 key pair for SSH access
```

### 🌐 **Networking Layer**
#### **VPC Configuration**
- **CIDR Block**: 10.0.0.0/16 (65,536 IP addresses)
- **Multi-AZ Deployment**: Spans 2 Availability Zones for high availability
- **DNS Support**: Enabled for hostname resolution

#### **Subnet Architecture**
```
├── Public Subnets (10.0.1.0/24, 10.0.2.0/24)
│   ├── ALB instances
│   ├── NAT Gateway
│   └── Internet Gateway access
└── Private Subnets (10.0.3.0/24, 10.0.4.0/24)
    ├── EC2 application instances
    ├── Auto Scaling Group
    └── Outbound traffic via NAT Gateway
```

#### **Gateway & Routing**
- **Internet Gateway**: Provides internet access to public subnets
- **NAT Gateway**: Enables secure outbound internet access for private instances
- **Route Tables**: Custom routing for public/private subnet traffic

### �️ **Security Groups**
#### **ALB Security Group**
```yaml
SecurityGroupIngress:
  - IpProtocol: tcp
    FromPort: 80
    ToPort: 80
    CidrIp: 0.0.0.0/0      # HTTP traffic from anywhere
  - IpProtocol: tcp
    FromPort: 443
    ToPort: 443
    CidrIp: 0.0.0.0/0      # HTTPS traffic from anywhere
```

#### **EC2 Security Group**
```yaml
SecurityGroupIngress:
  - IpProtocol: tcp
    FromPort: 8000
    ToPort: 8000
    SourceSecurityGroupId: !Ref ALBSecurityGroup  # Only ALB traffic
  - IpProtocol: tcp
    FromPort: 22
    ToPort: 22
    CidrIp: 0.0.0.0/0      # SSH access (configure as needed)
```

### �🚀 **Compute Layer**
#### **Launch Template**
```yaml
LaunchTemplate:
  ImageId: ami-0c02fb55956c7d316    # Amazon Linux 2023
  InstanceType: t3.micro            # Cost-optimized for demo
  SecurityGroupIds: [!Ref EC2SecurityGroup]
  IamInstanceProfile: !Ref EC2InstanceProfile
  UserData: !Base64
    Fn::Sub: |
      #!/bin/bash
      yum update -y
      yum install -y python3 python3-pip git
      # Application deployment script
```

#### **Auto Scaling Group**
- **Min Size**: 2 instances (high availability)
- **Max Size**: 6 instances (handles traffic spikes)
- **Desired Capacity**: 2 instances (normal operation)
- **Health Check Type**: ELB (application-aware)
- **Health Check Grace Period**: 300 seconds

#### **Scaling Policies**
```yaml
ScaleUpPolicy:
  AdjustmentType: ChangeInCapacity
  ScalingAdjustment: 1
  Cooldown: 300

ScaleDownPolicy:
  AdjustmentType: ChangeInCapacity
  ScalingAdjustment: -1
  Cooldown: 300
```

### ⚖️ **Load Balancing**
#### **Application Load Balancer**
```yaml
Scheme: internet-facing
Subnets: [PublicSubnet1, PublicSubnet2]
SecurityGroups: [ALBSecurityGroup]
LoadBalancerAttributes:
  - Key: idle_timeout.timeout_seconds
    Value: '60'
```

#### **Target Group Configuration**
```yaml
HealthCheckPath: /health
HealthCheckProtocol: HTTP
HealthCheckIntervalSeconds: 30
HealthyThresholdCount: 2
UnhealthyThresholdCount: 5
```

#### **HTTPS Redirect**
```yaml
ListenerRule:
  Actions:
    - Type: redirect
      RedirectConfig:
        Protocol: HTTPS
        StatusCode: HTTP_301
```

### 🗄️ **Database Layer**
#### **DynamoDB Table**
```yaml
TableName: !Sub ${EnvironmentName}-RecipesTable
BillingMode: ON_DEMAND              # Pay-per-request pricing
PointInTimeRecoveryEnabled: true    # Backup and restore
```

#### **Global Secondary Index**
```yaml
GlobalSecondaryIndexes:
  - IndexName: CategoryIndex
    KeySchema:
      - AttributeName: category
        KeyType: HASH
    Projection:
      ProjectionType: ALL
```

### 🔐 **IAM Security**
#### **EC2 Instance Role**
```yaml
AssumeRolePolicyDocument:
  Statement:
    - Effect: Allow
      Principal:
        Service: ec2.amazonaws.com
      Action: sts:AssumeRole

Policies:
  - PolicyName: DynamoDBAccess
    PolicyDocument:
      Statement:
        - Effect: Allow
          Action:
            - dynamodb:GetItem
            - dynamodb:PutItem
            - dynamodb:Query
            - dynamodb:Scan
            - dynamodb:UpdateItem
            - dynamodb:DeleteItem
          Resource: !GetAtt RecipesTable.Arn
```

### 📊 **Monitoring & Alarms**
#### **CloudWatch Alarms**
```yaml
HighCPUAlarm:
  MetricName: CPUUtilization
  ComparisonOperator: GreaterThanThreshold
  Threshold: 70
  EvaluationPeriods: 2
  AlarmActions: [!Ref ScaleUpPolicy]

LowCPUAlarm:
  MetricName: CPUUtilization
  ComparisonOperator: LessThanThreshold
  Threshold: 25
  EvaluationPeriods: 2
  AlarmActions: [!Ref ScaleDownPolicy]
```

### 📤 **Outputs for Integration**
```yaml
Outputs:
  VPCId:
    Description: VPC ID for cross-stack references
    Value: !Ref VPC
    Export:
      Name: !Sub ${EnvironmentName}-VPCID
  
  ApplicationLoadBalancer:
    Description: ALB DNS name
    Value: !GetAtt ApplicationLoadBalancer.DNSName
  
  DynamoDBTable:
    Description: DynamoDB table name
    Value: !Ref RecipesTable
```

---

## 🚀 Key Features

- ✨ **Recipe Management**: Create, read, and delete recipes with ease
- 🎯 **Role-based Access**: Separate admin and user interfaces  
- 📱 **Responsive Design**: Works seamlessly on desktop, tablet, and mobile
- ⚡ **High Performance**: DynamoDB provides fast data access
- 🌍 **Global Reach**: CloudFront ensures fast loading worldwide
- 🔐 **Secure**: HTTPS encryption and AWS security best practices
- 📈 **Auto-Scaling**: Automatic capacity management based on demand
- 🏗️ **Infrastructure as Code**: Complete CloudFormation template for reproducible deployments

---

## 🔭 Upcoming Work

- Enhance user authentication with AWS Cognito and social identity providers
- Implement end-to-end integration tests and CI/CD pipelines for automated deployments
- Add a mobile-first UI and native mobile app support (React Native / Expo)
- Improve analytics and usage tracking with Amazon Pinpoint / CloudWatch dashboards
- Add multi-region failover and disaster recovery testing


---

## 🐳 Docker Usage

The application includes Docker configuration for easy local development and deployment:

```bash
# Build and run the application
docker-compose up --build

# Run in detached mode
docker-compose up -d

# Stop the application
docker-compose down

# View logs
docker-compose logs -f backend
docker-compose logs -f frontend
```

### Docker Architecture
```yaml
# docker-compose.yml structure
services:
  frontend:
    build: ./frontend
    ports: ["3000:80"]
    depends_on: [backend]
    
  backend:
    build: ./backend
    ports: ["8000:8000"]
    environment:
      - AWS_REGION=us-east-1
      - DYNAMODB_TABLE=RecipesTable
```

The Docker setup includes:
- **Frontend**: Nginx server serving the React build 🌐
- **Backend**: Python FastAPI application 🐍
- **Environment**: Configured for development and production 🛠️
- **Volume Mounting**: For hot reloading during development 🔄

---

## 🌟 Why This Architecture?

This architecture demonstrates several AWS best practices and learning outcomes:

### **🏗️ Scalability**
- **Auto Scaling Groups**: Automatically add/remove instances based on demand
- **Application Load Balancer**: Distributes traffic evenly across healthy instances
- **DynamoDB On-Demand**: Scales read/write capacity automatically
- **CloudFront CDN**: Reduces origin load and improves global performance

### **🛡️ Security**
- **VPC Isolation**: Private subnets protect application instances
- **Security Groups**: Act as virtual firewalls with least privilege rules
- **IAM Roles**: Eliminate hardcoded credentials and follow least privilege
- **HTTPS Everywhere**: SSL/TLS encryption for all communications

### **⚡ Performance**
- **Multi-AZ Deployment**: Reduces latency and improves availability
- **CloudFront Edge Locations**: Cache content closer to users
# Recipe Three-Tier Architecture — Cloud Platform

[![AWS](https://img.shields.io/badge/AWS-100000?style=for-the-badge&logo=amazon-aws&logoColor=white&color=FF9900)](https://aws.amazon.com/)
[![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)](https://reactjs.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)](https://fastapi.tiangolo.com/)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)

Short, human-centered README prepared for submission to the Manara SAA program. This document focuses on clear project intent, architecture overview, and next steps — written in a concise, professional tone.

## Acknowledgments

This project was developed as part of an AWS Solutions Architect learning path. Many thanks to the instructors and mentors for their excellent courses, clear guidance, and the learning environment that made this work possible.

## Project Summary

Recipe Three-Tier Architecture is a cloud-native recipe sharing platform demonstrating practical use of AWS services and Infrastructure as Code. It is intended as a demonstration project for hands-on learning and submission to the SAA program.

Key goals:
- Demonstrate deployment patterns for a three-tier web application on AWS
- Show Infrastructure as Code using CloudFormation (included)
- Provide a developer-friendly local environment with Docker and Docker Compose

## Quickstart (local development)

Prerequisites:
- Docker & Docker Compose
- Node.js (for frontend development) and Python 3.10+ (for backend)

Get started:

```bash
# from repository root
docker-compose up --build

# frontend (if developing locally without Docker)
cd frontend
npm install
npm run dev

# backend (if developing locally without Docker)
cd backend
python -m pip install -r requirements.txt
uvicorn main:app --reload --port 8000
```

## What’s included

- `backend/` — FastAPI backend and API endpoints
- `frontend/` — React + TypeScript single-page application
- `platform/` — CloudFormation template implementing core infrastructure
- `terraform/` — Optional Terraform examples and helper scripts
- `docker-compose.yml` — Local development orchestration

## Architecture (high level)

The project demonstrates a standard three-tier architecture:

- Presentation (frontend): React app hosted on S3 and served via CloudFront for global distribution
- Application (backend): FastAPI application running on EC2 instances behind an Application Load Balancer
- Data (database): DynamoDB for scalable, low-latency storage

Networking and security are implemented using a VPC with public/private subnets, security groups, and IAM roles following least-privilege principles.

## Key Features

- Recipe CRUD functionality with a responsive UI
- Role-based access patterns for admin and regular users
- Infrastructure as Code with a CloudFormation template
- Docker-based local development for fast iteration

## Upcoming work

- Add federated sign-in using Amazon Cognito
- Harden deployment pipelines and add end-to-end tests
- Improve observability with CloudWatch dashboards and alerts
- Add mobile-first enhancements and a lightweight mobile client

## Submission note

This repository is prepared for submission to Manara as part of the SAA course requirements. The README and project structure are written to be clear and review-ready.

## Contributing

Contributions are welcome. If you plan to fork or extend this project, please open an issue describing your intent and create a feature branch for changes.

## License

See the `LICENSE` file in the repository root.

## Contact

For questions about this submission or requests for additional materials, contact the project maintainer.

## Makefile

A small set of `make` targets is provided to speed up common development tasks. Run them from the repository root.

Key targets

- `make install` — install backend and frontend dependencies
- `make install-backend` — create a Python virtualenv and install backend requirements
- `make run-backend` — run the backend application (uses the virtualenv)
- `make install-frontend` — install frontend npm packages
- `make dev-frontend` — start the frontend dev server (Vite)
- `make build-frontend` — build the frontend for production
- `make up` — start services with docker-compose
- `make down` — stop services started by docker-compose
- `make help` — list available targets

Examples

```bash
# Install dependencies (backend + frontend)
make install

# Start frontend dev server
make dev-frontend

# Start the stack with Docker Compose
make up
```
# recipe-three-tier-architecture
