# verkstedt-case

This repository contains the solution for the Infrastructure Demo as part of the application for the **Mid-Range / Senior Cloud Infrastructure Engineer (f/m/x)** position at verkstedt.

Author: **Krystsian Shevando**

---

## Task Mapping

| Folder           | Description                                                                 |
|------------------|-----------------------------------------------------------------------------|
| `application/`   | Contains a simple Nginx web server with custom config and CI/CD pipeline    |
| `helm/`          | Helm charts for deploying Nginx, PostgreSQL, and Prometheus-based monitoring |
| `infrastructure/`| Terraform code for GCP infrastructure provisioning                          |

Each subdirectory includes a dedicated `README.md` file with detailed documentation of implementation decisions, usage instructions, and areas for potential improvement.

---

## What to Expect

The repository follows a modular and reproducible structure:
- Docker and CI/CD setup for a simple web server
- Helm-based deployment for Kubernetes components, tested on Minikube
- Terraform infrastructure code with environment and component isolation, based on GCP
- Each section highlights architectural trade-offs, potential improvements, and testing strategies

---

For more details on specific tasks, please refer to the respective folder’s README.
