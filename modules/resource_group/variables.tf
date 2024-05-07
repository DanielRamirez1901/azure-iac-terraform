# resource_group/variables.tf

variable "resource_group_name" {
  description = "The name of the Resource Group."
  type        = string
}

variable "location" {
  description = "The name of the location in which the Resource Group is deployed."
  type        = string
}
