terraform {
  required_version = ">=1.4.0"
}
resource "google_cloudfunctions_function" "function-gen1" {
  name                  = var.function_name
  runtime               = var.function_runtime
  available_memory_mb   = var.function_memory
  source_archive_bucket = var.bucket_name
  source_archive_object = var.object_name
  trigger_http          = true
  entry_point           = var.function_entry_point
}
# IAM entry for all users to invoke function

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function-gen1.project
  region         = google_cloudfunctions_function.function-gen1.region
  cloud_function = google_cloudfunctions_function.function-gen1.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"

}
