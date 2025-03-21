terraform {
  required_version = ">=1.4.0"
}
resource "google_storage_bucket" "bucket" {
  name                     = var.bucket_name
  location                 = var.bucket_location
  force_destroy            = true
  public_access_prevention = var.public_access
}

resource "google_storage_bucket_object" "bucket-object" {
  name   = var.bucket_object_name
  source = var.bucket_object_path
  bucket = google_storage_bucket.bucket.name

}
