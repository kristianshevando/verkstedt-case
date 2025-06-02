# Terraform GCP Artifact Registry Module

This module creates a **Docker Artifact Registry repository** in GCP.

---

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `project_id` | GCP project ID | `string` | — | Yes |
| `region` | Region where repository is created | `string` | — | Yes |
| `repository_id` | Unique ID for the repository | `string` | — | Yes |
| `description` | Repository description | `string` | `"Docker repository"` | No |

---

## Outputs

| Name | Description |
|------|-------------|
| `repository_id` | Repository ID |
| `repository_location` | Region of the repository |
| `repository_url` | Docker endpoint URL of the repository |

---

## Example Usage

```hcl
module "artifact_repo" {
  source         = "../modules/google/google-artifact-registry-repository"
  project_id     = "my-gcp-project"
  region         = "europe-west1"
  repository_id  = "demo-docker"
  description    = "Demo Docker registry"
}
```
