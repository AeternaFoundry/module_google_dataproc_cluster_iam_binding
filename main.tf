resource "google_dataproc_cluster_iam_binding" "dataproc_cluster_iam_bindings" {
  for_each = var.dataproc_cluster_iam_bindings

  cluster = each.value.cluster
  members = each.value.members
  role    = each.value.role
  project = each.value.project
  region  = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

