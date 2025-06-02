# Common Infrastructure: VPC Peering

This component sets up **VPC peering connections** between GCP environments:
- Core (GKE)
- SQL (CloudSQL)
- Mgmt (compute instances)

---

## Features

- Bi-directional peering between:
  - Core ↔ SQL
  - Core ↔ Mgmt

---

## Inputs

| Name                | Description                         | Type   | Required |
|---------------------|-------------------------------------|--------|----------|
| `project_id`        | GCP project ID                      | string | yes      |
| `core_state_bucket` | GCS bucket for core terraform state | string | yes      |
| `core_state_prefix` | Prefix for core tfstate             | string | yes      |
| `sql_state_bucket`  | GCS bucket for sql terraform state  | string | yes      |
| `sql_state_prefix`  | Prefix for sql tfstate              | string | yes      |
| `mgmt_state_bucket` | GCS bucket for mgmt terraform state | string | yes      |
| `mgmt_state_prefix` | Prefix for mgmt tfstate             | string | yes      |

---

## Outputs

| Name                         | Description                        |
|------------------------------|------------------------------------|
| `peering_core_sql_name`      | Name of peering from core to sql   |
| `peering_core_mgmt_name`     | Name of peering from core to mgmt  |

---

## Usage

```bash
terraform apply -var-file="nonprod.tfvars"
