# Description

`monitoring-verkstedt` is a Helm chart providing a minimal monitoring setup using Prometheus and Node Exporter as part of a Case Study for the Mid-Range / Senior Cloud Infrastructure Engineer (f/m/x) position application at verkstedt.

## Parameters

| Parameter                         | Default Value                    | Description                                                  |
|:----------------------------------|:----------------------------------|:-------------------------------------------------------------|
| conf.prometheus                   | See values.yaml                  | Configuration content for `prometheus.yml` passed via ConfigMap |
| prometheus.image.repository       | prom/prometheus                  | Prometheus container image repository                       |
| prometheus.image.tag              | v2.52.0                          | Prometheus container image tag                              |
| prometheus.image.pullPolicy       | IfNotPresent                     | Prometheus image pull policy                                |
| prometheus.resources              | limits & requests defined        | Prometheus resource limits and requests                     |
| prometheus.service.port           | 9090                             | Port exposed by Prometheus service                          |
| prometheus.pvc.size               | 1Gi                              | Persistent volume claim size for Prometheus data            |
| prometheus.pvc.storageClass       | ""                               | Storage class for Prometheus PVC                            |
| nodeExporter.image.repository     | prom/node-exporter               | Node Exporter container image repository                    |
| nodeExporter.image.tag            | v1.8.1                           | Node Exporter container image tag                           |
| nodeExporter.image.pullPolicy     | IfNotPresent                     | Node Exporter image pull policy                             |
| nodeExporter.resources            | limits & requests defined        | Node Exporter resource limits and requests                  |
| nodeExporter.service.port         | 9100                             | Port exposed by Node Exporter service                       |
| nodeExporter.serviceName          | node-exporter                    | Internal DNS name used for Node Exporter in Prometheus config |