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
  directory                    = "../export/prod"  # Export files to export/prod folder
  include_filter_resources     = []                # Export all supported resource types
  export_as_hcl                = true              # Export in HCL format
  include_state_file           = false             # Exclude the state file for portability
  split_files_by_resource      = false             # Set to true to split files by resource type
  enable_dependency_resolution = true              # Include dependencies automatically
  log_permission_errors        = true              # Log permission errors instead of failing
}
