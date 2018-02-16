variable "project_id" {
  description = "The project ID"
}
variable "region" {
  description = "The region"
}
variable "prefix" {
  description = "The prefix for the resource names"
}
variable "machine_type" {
  description = "The type of the machine"
}
variable "zone" {
  description = "The zone where VM resides"
}
variable "disk_image" {
  description = "The boot disk image"
}
variable "disk_size" {
  description = "The boot disk size"
}
variable "disk_type" {
  description = "The boot disk type"
}
variable "auto_delete" {
  description = "The auto delete feature for boot disk"
}
variable "subnetwork" {
  description = "The subnetwork ID"
}
variable "subnet_project" {
  description = "The subnetwork project ID"
}
