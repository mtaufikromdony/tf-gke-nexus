  variable "project_id" {
    description = "Google Project ID."
    type        = string
  }

  variable "region" {
    description = "Google Cloud region"
    type        = string
  }

  variable "machine_type" {
    description = "Google VM Instance type."
    type        = string
  }

  variable "name" {
  type        = string
  description = "The name of the cluster."
  }

  variable "initial_node_count" {
  type        = number
  description = "The number of nodes to create in this cluster's default node pool."
  }

  variable "min_count" {
  type        = number
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
  }

  variable "max_count" {
  type        = number
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
  }

  variable "disk_size_gb" {
  type        = number
  description = "Size of the node's disk."
  }