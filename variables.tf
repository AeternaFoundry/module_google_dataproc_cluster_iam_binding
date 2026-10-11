variable "dataproc_cluster_iam_bindings" {
  description = <<EOT
Map of dataproc_cluster_iam_bindings, attributes below
Required:
    - cluster
    - members
    - role
Optional:
    - project
    - region
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    cluster = string
    members = set(string)
    role    = string
    project = optional(string)
    region  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

