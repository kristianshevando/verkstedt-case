# Terraform Infrastructure

Case Study for the Mid-Range / Senior Cloud Infrastructure Engineer (f/m/x) position application at verkstedt.  
Author: Krystsian Shevando

---

## Project Structure

```
.
├── environments/
│   ├── nonprod/
│   │   ├── common/
│   │   ├── core/
│   │   ├── mgmt/
│   │   └── sql/
│   └── prod/
│       ├── common/
│       ├── core/
│       ├── mgmt/
│       └── sql/
├── modules/
│   └── google/
│       ├── google-artifact-registry-repository/
│       ├── google-compute-firewall/
│       ├── google-compute-instance/
│       ├── google-compute-network/
│       ├── google-compute-network-peering/
│       ├── google-compute-subnetwork/
│       ├── google-kubernetes-engine/
│       └── google-sql-database-instance/
├── tfvars/
│   ├── nonprod.common.tfvars
│   ├── nonprod.core.tfvars
│   ├── nonprod.mgmt.tfvars
│   ├── nonprod.sql.tfvars
│   ├── prod.common.tfvars
│   ├── prod.core.tfvars
│   ├── prod.mgmt.tfvars
│   └── prod.sql.tfvars
└── README.md
```

---

## Components

| Component | Description |
|----------|-------------|
| `core`   | Deploys GKE clusters, supports multi-region setup |
| `sql`    | Creates Cloud SQL PostgreSQL instances |
| `mgmt`   | Compute instances (e.g. Bastion or Deployment Agents) and Docker artifact registry |
| `common` | Establishes VPC peering across components |

Each component is isolated in its own Terraform workspace, controlled via its own tfvars file and state.

---

## Usage

### 1. Go to the desired environment and component

```bash
cd environments/nonprod/core
```

### 2. Initialize Terraform with backend config

```bash
terraform init \
  -backend-config="bucket=tfstate-nonprod" \
  -backend-config="prefix=core/terraform.tfstate"
```

### 3. Apply with tfvars

```bash
terraform apply -var-file="../../../tfvars/nonprod.core.tfvars"
```

---

## Modules

All modules are located under `modules/google/` and structured uniformly:

- `main.tf` — Resource definitions
- `variables.tf` — Parameter definitions with descriptions
- `outputs.tf` — Cross-module output references
- `versions.tf` — Provider versions
- `README.md` — Usage documentation

---

## tfvars Overview

Each component in each environment has a dedicated tfvars file located in `/tfvars/`.

---

## Infrastructure Summary

- Uses Google Cloud Storage backend for remote state
- Each component deploys isolated infrastructure pieces
- VPC peering connects `core`, `sql`, and `mgmt` privately
- Designed for multi-environment deployment (nonprod/prod)

---

## Improvements and Considerations

### Infrastructure Components Not Included

- **Load balancers**: External access to applications could be exposed via GCP Load Balancer or NGINX Ingress.
- **Storage buckets**: No solution for storing app assets, logs, or backups.
- **IAM roles**: GCP IAM was not explicitly handled. Role-based access control for service accounts and users should be defined.
- **Tags & labels**: Helpful for cost tracking and management; currently missing.
- **VPN/Gateway**: No private connectivity solution like S2S VPN or IAP is implemented.
- **And many other possible improvements...**

### Better Architecture Flexibility

- Component configurations could be extracted into a centralized location to improve reuse across environments.
- Consider using tools like `Terragrunt` or even splitting tfvars into their own config repo.
- Supporting dynamic configuration via variables would allow easier scaling and environment branching.

### Security & Policies

- Network policies not implemented for Kubernetes clusters.
- Secret management is basic (inline or Kubernetes Secret); using something like HashiCorp Vault or GCP Secret Manager would be better.

### Scaling

- No autoscaling was implemented.
- Namespace-level resource quotas and limits could help enforce boundaries between environments or apps.

## Infrastructure: Testing, Updates, and Versioning

### Testing Strategy

There are a few layers to testing infrastructure, depending on what you're working on and how strict the process needs to be:

1. **Code validation**

   The simplest step is running `terraform validate` across all directories — fast and cheap, but won’t catch logic errors.

   Tools like `tflint` help enforce style, variable usage, and naming conventions.

   For more serious setups, you can add static code analysis like `checkov`, `tfsec`, or `terrascan`. These scan for open ports, missing encryption, bad IAM policies, etc. Whether it’s necessary depends on the risk tolerance and expectations in your environment.

2. **Provisioning validation**

   It’s important to test from scratch: create all resources in a clean environment and check if they deploy and connect as expected. Especially relevant when using parameterized configs and multiple tfvars scenarios.

   Another layer is testing updates — what happens if someone upgrades the infra version in an existing environment? You can’t always automate that — sometimes it’s just a careful `terraform plan` and a gut check.

   Maintaining a changelog can help here, especially if multiple environments or teams rely on the same modules. Not mandatory, but useful.

3. **Runtime drift detection**

   Manual changes happen (via console, UI, or emergency fixes), and Terraform won’t know unless you check. Running `terraform plan` regularly helps detect drift.

   You can even automate drift checks in CI, if you’re fancy — but even basic manual review is better than nothing.

---

### Updates and Versioning

How you version and manage changes depends on how tightly infrastructure is coupled with the application and how updates are coordinated:

- Some teams use release branches like `release/1.2.0` while keeping `main` as the dev tip.
- Others prefer to separate code and config completely — e.g., store tfvars in a separate repo and use `terragrunt` to glue things together.

Semantic versioning works well as a mental model:
- `patch` — small fixes or refactors with no side effects
- `minor` — new features or extensions, safe to update
- `major` — breaking changes or anything that might trigger recreation of key resources

Again, it depends — no one-size-fits-all approach.

---

### Real-world Infra Updates

On production, you don’t just hit “apply.” Updates usually require coordination with the business or customer — especially when critical services or networking are involved.

Sometimes you’ll have to manipulate state (e.g., `terraform state mv`) to avoid destructive changes. This isn’t ideal, but it’s part of real-world infra work.

Also, config drift is real — someone changes something manually, and Terraform wants to “fix” it. The key is always: **read the plan** and understand what will happen before you do anything.

In short: processes vary, but the goal is the same — keep things clean, safe, and predictable.
