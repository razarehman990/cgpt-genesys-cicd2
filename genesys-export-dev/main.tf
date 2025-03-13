terraform {
  required_providers {
    genesyscloud = {
      source  = "mypurecloud/genesyscloud"
      version = ">= 1.9.0"
    }
  }
}

variable "aws_region" {
  type        = string
  description = "AWS region for Genesys Cloud (e.g. 'ca-central-1')"
}

provider "genesyscloud" {
  aws_region = var.aws_region
}

resource "genesyscloud_tf_export" "full_export" {
  directory                    = "../export/dev"  # Exports to export/dev folder
  include_filter_resources     = []               # Empty list exports all supported resource types
  export_as_hcl                = true             # Export in human-readable HCL
  include_state_file           = false            # Exclude the state file for portability
  split_files_by_resource      = false            # Set to true to split files per resource
  enable_dependency_resolution = true             # Include dependencies automatically
  log_permission_errors        = true             # Log permission errors rather than failing
}
