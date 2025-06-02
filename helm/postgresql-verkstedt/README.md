# Description

`postgresql-verkstedt` is a Helm chart to deploy a PostgreSQL database using a StatefulSet as part of a case study for the Mid-Range / Senior Cloud Infrastructure Engineer (f/m/x) position at verkstedt.

## Parameters

| Parameter                         | Default Value             | Description                                                               |
|:----------------------------------|:---------------------------|:---------------------------------------------------------------------------|
| postgresql.replicas               | `1`                        | Number of PostgreSQL replicas                                              |
| postgresql.reloader               | `true`                     | Enables Stakater Reloader annotations                                      |
| postgresql.database               | `mydb`                     | Name of the PostgreSQL database                                            |
| postgresql.user                   | `myuser`                   | Username for the PostgreSQL connection                                     |
| postgresql.password               | `mypassword`               | Password for the PostgreSQL connection                                     |
| postgresql.secret.enabled         | `true`                     | Whether to create a Kubernetes Secret for credentials                      |
| postgresql.secret.name            | `postgresql-secret`        | Name of the Secret                                                         |
| postgresql.secret.data            | templated from values      | Key-value map of secret data; templated from top-level values              |
| postgresql.image.repository       | `postgres`                 | Docker image repository for PostgreSQL                                     |
| postgresql.image.tag              | `15`                       | Docker image tag                                                           |
| postgresql.image.pullPolicy       | `IfNotPresent`             | Image pull policy                                                          |
| postgresql.imagePullSecrets       | `[]`                       | Optional list of image pull secrets                                        |
| postgresql.podAnnotations         | `{}`                       | Annotations for the PostgreSQL pod                                         |
| postgresql.resources.requests     | `cpu: 250m`, `memory: 256Mi` | CPU and memory requests                                                    |
| postgresql.resources.limits       | `cpu: 500m`, `memory: 512Mi` | CPU and memory limits                                                      |
| postgresql.extraVolumes           | `[]`                       | Optional additional volumes                                                |
| persistence.enabled               | `true`                     | Whether to create a PersistentVolumeClaim                                  |
| persistence.size                  | `1Gi`                      | PVC storage size                                                           |
| persistence.storageClass          | `""`                       | Storage class to use (default if empty)                                    |
| service.port                      | `5432`                     | Service port for PostgreSQL                                                |
| service.name                      | `postgres`                 | Name of the Kubernetes Service                                             |
