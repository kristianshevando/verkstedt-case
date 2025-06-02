variable "project_id" {
  description = "GCP project where the firewall rule is created"
  type        = string
}

variable "network" {
  description = "The name of the VPC network this firewall applies to"
  type        = string
}

variable "name" {
  description = "Custom name for the firewall rule. If not set, generated from direction and network"
  type        = string
  default     = ""
}

variable "direction" {
  description = "Traffic direction: INGRESS or EGRESS"
  type        = string
  default     = "INGRESS"
}

variable "priority" {
  description = "Firewall rule priority. Lower is higher priority"
  type        = number
  default     = 1000
}

variable "disabled" {
  description = "Whether the rule is disabled"
  type        = bool
  default     = false
}

variable "description" {
  description = "Optional description for the firewall rule"
  type        = string
  default     = ""
}

variable "allow_rules" {
  description = "List of allow rules (each with protocol and optional ports)"
  type = list(object({
    protocol = string
    ports    = optional(list(string))
  }))
  default = []
}

variable "deny_rules" {
  description = "List of deny rules (each with protocol and optional ports)"
  type = list(object({
    protocol = string
    ports    = optional(list(string))
  }))
  default = []
}

variable "source_ranges" {
  description = "CIDR blocks allowed for ingress"
  type        = list(string)
  default     = []
}

variable "destination_ranges" {
  description = "CIDR blocks allowed for egress"
  type        = list(string)
  default     = []
}

variable "source_tags" {
  description = "Source tags for ingress traffic"
  type        = list(string)
  default     = []
}

variable "target_tags" {
  description = "Target tags for matching instances"
  type        = list(string)
  default     = []
}

variable "target_service_accounts" {
  description = "List of target service accounts for this rule"
  type        = list(string)
  default     = []
}

variable "logging_metadata" {
  description = "Firewall logging metadata setting (include-all, exclude-all, etc.)"
  type        = string
  default     = "EXCLUDE_ALL"
}
