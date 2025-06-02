# verkstedt-case Helm Charts

Case Study for the Mid-Range / Senior Cloud Infrastructure Engineer (f/m/x) position application at verkstedt.  
Author: Krystsian Shevando

---

## Project Structure

```
helm/
├── app-override/           # Optional override HTML and config files for nginx
├── charts/                 # Packaged Helm charts
├── monitoring-verkstedt/   # Prometheus + Node Exporter Helm chart
├── nginx-verkstedt/        # Nginx-based web app Helm chart
├── postgresql-verkstedt/   # PostgreSQL Helm chart
├── values-monitoring.yaml  # Values file for monitoring deployment
├── values-nginx.yaml       # Values file for nginx deployment
├── values-postgres.yaml    # Values file for postgres deployment
└── README.md               # This file
```

---

## Charts Overview

### nginx-verkstedt

> Helm chart for a simple nginx-based application. Supports static content injection, DB connection via Kubernetes Secret, and configuration reloading.

- Resources: Deployment, Service, Ingress, ConfigMaps, Secrets
- Namespace: `app`

Usage:
```bash
helm install nginx-verkstedt ./helm/nginx-verkstedt --create-namespace --namespace app --values ./helm/values-nginx.yaml
```

Override static files:
```bash
helm install nginx-verkstedt ./helm/nginx-verkstedt --create-namespace --namespace app --values ./helm/values-nginx.yaml --set-file html.index=helm/app-override/index.html
```

Access (Minikube):
```bash
minikube service nginx-verkstedt-svc --namespace app --url
```

---

### postgresql-verkstedt

> Stateful PostgreSQL deployment with persistent volume claim, basic configuration via Helm.

- Resources: StatefulSet, Service, Secret, PVC
- Namespace: `postgres`

Usage:
```bash
helm install postgresql-verkstedt ./helm/postgresql-verkstedt --create-namespace --namespace postgres --values ./helm/values-postgres.yaml
```

---

### monitoring-verkstedt

> Monitoring stack using Prometheus and Node Exporter. Prometheus uses a StatefulSet with PVC. Node Exporter runs as a DaemonSet.

- Resources: StatefulSet (Prometheus), DaemonSet (Node Exporter), Services, ConfigMap, PVC
- Namespace: `monitoring`

Usage:
```bash
helm install monitoring-verkstedt ./helm/monitoring-verkstedt --create-namespace --namespace monitoring --values ./helm/values-monitoring.yaml
```

---

## Architectural Decisions & Trade-Offs

- Chose to use **Helm charts** for all components to ensure consistency, templating, and future extensibility.
- Introduced **StatefulSet** for PostgreSQL and Prometheus to support persistent storage needs.
- Avoided external dependencies or cloud provider-specific features to maintain portability in local environments (Minikube).
- Implemented **configurable values** for flexibility via `values.yaml` and `--set` overrides.

---

## What Could Be Improved

- **Network Policies not implemented:** Could be added to restrict traffic between namespaces and enforce isolation between app, DB, and monitoring.
- **Secret duplication:** Database secrets are defined in two places (nginx and postgres charts). Ideally, use a shared secret or external vault (e.g., HashiCorp Vault or Sealed Secrets).
- **No centralized logging:** Loki or another log collector could be added to complete the observability stack.
- **No ingress or TLS configuration tested:** Ingress resource exists but is disabled. TLS setup is left out for simplicity.
- **No test automation:** Health checks are in place via probes, but there is no infrastructure-level testing (e.g., kubeval, conftest, Helm tests).
- **No CI/CD pipeline:** Helm charts and manifests could be wired into a GitHub Actions or GitLab CI setup for automated deployment/validation.
- **No RBAC configuration or access policies:** Service accounts and access controls are not explicitly declared but could be added to strengthen security.

---

## Testing Approach

If time permitted, I would approach testing as follows:

- **Helm Linting & Template Rendering:** Use `helm lint` to validate correctness.
- **Schema Validation:** Tools like `kubeval` or `kubeconform` for manifest schema checks.
- **Smoke Tests:** After deployment, assert all Pods reach Ready state and Services are routable.
- **Functional Checks:** Simple curl/wget test against the exposed Nginx endpoint and Prometheus UI.

---

## Summary

This project reflects a modular, production-inspired structure designed to be easily extended and reused.  
All choices were made to balance clarity, functionality, and demo constraints under the 4-hour limit.
