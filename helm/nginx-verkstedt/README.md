
# nginx-verkstedt

`nginx-verkstedt` is a Helm chart designed for deploying a simple web server (NGINX) as part of a case study for the Mid-Range / Senior Cloud Infrastructure Engineer (f/m/x) position at Verkstedt.

## Parameters

| Parameter                         | Default Value                | Description                                                                 |
|----------------------------------|------------------------------|-----------------------------------------------------------------------------|
| `nameOverride`                   | `""`                         | Partly overrides the `fullname` template (retains release name)            |
| `fullnameOverride`               | `""`                         | Fully overrides the `fullname` template                                     |
| `application.reloader`          | `false`                      | Enables Stakater Reloader annotations for auto-reload on ConfigMap changes |
| `application.replicas`          | `1`                          | Number of deployment replicas                                               |
| `application.revisionHistoryLimit` | `3`                       | Revision history limit for deployment rollbacks                            |
| `application.podAnnotations`    | `{}`                         | Additional annotations for the pod                                          |
| `application.imagePullSecrets`  | `[]`                         | Docker registry secrets                                                     |
| `application.image.repository`  | `kshevando/nginx-verkstedt` | Image repository                                                            |
| `application.image.tag`         | `""`                         | Image tag (defaults to `latest` if empty)                                   |
| `application.image.pullPolicy`  | `IfNotPresent`               | Image pull policy                                                           |
| `application.probes`            | Custom liveness & readiness  | Kubernetes health checks                                                    |
| `application.resources`         | `{}`                         | CPU and memory resource requests/limits                                     |
| `service.type`                  | `ClusterIP`                  | Service type (`ClusterIP`, `NodePort`, etc.)                                |
| `service.port`                  | `80`                         | Service port                                                                |
| `service.name`                  | `""`                         | Optional service name override                                              |
| `service.nodePort`              | `""`                         | NodePort value (required if service type is `NodePort`)                     |
| `db.host`                       | (DNS to PostgreSQL service)  | Database host                                                               |
| `db.port`                       | `5432`                       | Database port                                                               |
| `db.name`                       | `mydb`                       | Database name                                                               |
| `db.user`                       | `myuser`                     | Database user                                                               |
| `db.password`                   | `mypassword`                 | Database password                                                           |
| `db.secret.name`                | `db-credentials`             | Name of the Kubernetes secret                                               |
| `ingress.enabled`               | `false`                      | Enables ingress                                                             |
| `ingress.className`             | `""`                         | Ingress class (e.g., `nginx`)                                               |
| `ingress.annotations`           | `{}`                         | Ingress annotations                                                         |
| `ingress.hosts`                 | See `values.yaml`            | Ingress hosts configuration                                                 |
| `ingress.tls`                   | `[]`                         | TLS configuration                                                           |
