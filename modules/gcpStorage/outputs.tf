output "gcpBucketName" {
  value = google_storage_bucket.bucket.name
}
output "gcpBucketObjectName" {
  value = google_storage_bucket_object.bucket-object.name
}
