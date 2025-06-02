variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "core_state_bucket" {
  description = "GCS bucket for core state"
  type        = string
}

variable "core_state_prefix" {
  description = "GCS key prefix for core"
  type        = string
}

variable "sql_state_bucket" {
  description = "GCS bucket for sql state"
  type        = string
}

variable "sql_state_prefix" {
  description = "GCS key prefix for sql"
  type        = string
}

variable "mgmt_state_bucket" {
  description = "GCS bucket for mgmt state"
  type        = string
}

variable "mgmt_state_prefix" {
  description = "GCS key prefix for mgmt"
  type        = string
}
