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
  description = "AWS region for Genesys Cloud (e.g. 'us-east-1')"
}

provider "genesyscloud" {
  aws_region = var.aws_region
}

resource "genesyscloud_tf_export" "full_export" {
  directory                    = "../export/prod"  # Exports to export/prod folder
  include_filter_resources     = []                # Empty list means export all supported resources
  export_as_hcl                = true              # Export in HCL format
  include_state_file           = false             # Do not include the tfstate
  split_files_by_resource      = false             # Set to true for splitting by resource type
  enable_dependency_resolution = true              # Automatically include dependencies
  log_permission_errors        = true              # Log permission errors instead of failing
}
