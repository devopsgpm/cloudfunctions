variable "function_name" {
  type = string
}
variable "function_runtime" {
  type = string
}
variable "bucket_name" {
  type = string
}
variable "object_name" {
  type = string
}
variable "function_memory" {
  type    = number
  default = 128
}
variable "function_entry_point" {
  type = string
}
