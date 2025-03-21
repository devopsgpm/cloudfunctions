terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.26.0"
    }
  }
}

provider "google" {
  project = "hello-world-454204"
  region  = "us-central1"
}

# GCP STORAGE MODULE
module "gcp-cloud-storage" {
  source             = "./modules/gcpStorage"
  bucket_name        = "prasanna_cf_bucket"
  bucket_location    = "us-central1"
  public_access      = "enforced"
  bucket_object_name = "function.zip"
  bucket_object_path = "/home/girija/labs/terraform-project/function.zip"
}
# GCP Cloud Function Gen 1

module "gcp-cloudfunction-gen1" {
  source               = "./modules/gcpCloudFunctionGen1"
  function_name        = "demo-function"
  function_runtime     = "python310"
  bucket_name          = module.gcp-cloud-storage.gcpBucketName
  object_name          = module.gcp-cloud-storage.gcpBucketObjectName
  function_entry_point = "hello"
}


