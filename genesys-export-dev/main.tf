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
  directory                    = "../export/dev"  # Export files to export/dev folder
  include_filter_resources     = []               # Empty list means export all supported resources
  export_as_hcl                = true             # Export in human-readable HCL format
  include_state_file           = false            # Do not include the state file
  split_files_by_resource      = false            # Set to true if you prefer separate files per resource
  enable_dependency_resolution = true             # Automatically include resource dependencies
  log_permission_errors        = true             # Log permission errors instead of failing
}
