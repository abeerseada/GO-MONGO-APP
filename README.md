# Go App with MongoDB (Docker + Ansible)

##  Overview
This project is a sample **Go application** connected to a **MongoDB database**, containerized using **Docker**, and deployed via **Ansible**.  
It demonstrates:
- Multi-stage Docker builds for environment-specific images (`dev` and `prod`).
- Automated container lifecycle management.
- Image build and push to Docker Hub.
- Docker Compose deployment for production.

---

##  Technologies Used
- **Go** – Backend application logic.
- **MongoDB** – NoSQL database.
- **Docker & Docker Compose** – Containerization and orchestration.
- **Ansible** – Automation for build, push, and deployment.
- **Docker Hub** – Image registry.

---

## How It Works
1. **Stops and removes** existing containers (`go-container` & `mongo-container`).
2. **Removes old Docker images** (`dev` and `prod` tags).
3. **Builds new images** for each environment using Docker multi-stage builds.
4. **Pushes images** to Docker Hub.
5. **Deploys with Docker Compose** (production only).

---

## Secrets Management
Sensitive data like `DOCKERHUB_PASSWORD` is stored in `secrets.yaml`, encrypted using **Ansible Vault**.

Encrypt a file:
```bash
ansible-vault encrypt secrets.yaml
```
---
## Build & Run with Ansible
To execute the automation script:

```bash
ansible-playbook playbook.yaml --ask-vault-pass
```
You will be prompted for the Ansible Vault password.
---
 ## Run with Docker Compose (Production)
```bash
docker-compose up -d
```
## Cleaning Up
To remove unused build cache and free disk space:

```bash
docker builder prune
```
