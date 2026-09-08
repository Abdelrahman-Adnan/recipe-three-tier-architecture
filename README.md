# Recipe Three-Tier Architecture — Cloud Platform

[![AWS](https://img.shields.io/badge/AWS-100000?style=for-the-badge&logo=amazon-aws&logoColor=white&color=FF9900)](https://aws.amazon.com/)
[![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)](https://reactjs.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)](https://fastapi.tiangolo.com/)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)

Short, human-centered README for the Recipe Three-Tier Architecture project. This repository demonstrates a cloud-native three-tier web application with a React frontend, FastAPI backend, and AWS infrastructure examples.

## Project overview

- Presentation: React + Vite frontend (TypeScript)
- Application: FastAPI backend (Python)
- Data: DynamoDB (example) and infrastructure-as-code samples (CloudFormation / Terraform)

## Repository structure

```
recipe-three-tier-architecture/
├── backend/
│   ├── main.py
│   └── requirements.txt
├── frontend/
│   ├── package.json
│   └── src/
├── platform/
│   └── cloudformation.yaml
├── terraform/
├── docker-compose.yml
├── Dockerfile
├── Makefile
└── README.md
```

## Screenshots & diagrams

### Architecture diagram

![AWS architecture diagram](images/aws_manara_project_final_architecture.png)

Diagram: high-level AWS three-tier architecture used in this project (S3 + CloudFront for the frontend, ALB + EC2 for the application layer, DynamoDB for storage).

### App screenshots

- Hero / landing banner: ![Hero image](https://raw.githubusercontent.com/Abdelrahman-Adnan/recipe-three-tier-architecture/main/frontend/src/assets/images/recipe-hero.jpg) — main landing banner used on the Home page.
- Sample recipe card: ![Sample recipe](https://raw.githubusercontent.com/Abdelrahman-Adnan/recipe-three-tier-architecture/main/frontend/src/assets/images/sample-recipe-1.jpg) — example recipe shown in the gallery.
- Cuisine examples: ![American BBQ](https://raw.githubusercontent.com/Abdelrahman-Adnan/recipe-three-tier-architecture/main/frontend/src/assets/images/american-bbq.jpg) ![Asian stir fry](https://raw.githubusercontent.com/Abdelrahman-Adnan/recipe-three-tier-architecture/main/frontend/src/assets/images/asian-stir-fry.jpg) ![Italian pasta](https://raw.githubusercontent.com/Abdelrahman-Adnan/recipe-three-tier-architecture/main/frontend/src/assets/images/italian-pasta.jpg) — sample images used for recipe categories and demo content.

### Diagrams & references

- AWS services overview: ![AWS services overview](https://raw.githubusercontent.com/Abdelrahman-Adnan/recipe-three-tier-architecture/main/frontend/src/assets/images/aws-services-overview.png) — reference image summarizing AWS services used in this architecture.
- Project / Manara logo: ![Manara logo](https://raw.githubusercontent.com/Abdelrahman-Adnan/recipe-three-tier-architecture/main/frontend/src/assets/images/manara-logo.png) — branding used in documentation and slides.


## Quickstart (local development)

Prerequisites: Docker, Node.js, Python 3.10+

Start the stack with Docker Compose:

```bash
docker-compose up --build
```

Frontend (local development without Docker):

```bash
cd frontend
npm install
npm run dev
```

Backend (local development without Docker):

```bash
cd backend
python -m pip install -r requirements.txt
uvicorn main:app --reload --port 8000
```

## Makefile

A small set of `make` targets is included to simplify common tasks. Run from the repository root.

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

## Docker

Useful commands:

```bash
# Run in foreground
docker-compose up --build

# Run detached
docker-compose up -d

# Stop
docker-compose down

# View logs
docker-compose logs -f backend
docker-compose logs -f frontend
```

## What’s included

- `backend/` — FastAPI backend
- `frontend/` — React + TypeScript frontend
- `platform/` — CloudFormation template
- `terraform/` — Terraform examples
- `docker-compose.yml` — local orchestration

## Contributing

Open an issue with your proposed changes and create a feature branch. Keep changes focused and add tests where appropriate.

## License

See the `LICENSE` file in the repository root.

## Contact

For questions, contact the project maintainer.
