variable "location" {
  description = "Azure region"
  type        = string
  default     = "uaenorth"
}

variable "prefix" {
  description = "Naam ka pehla hissa"
  type        = string
  default     = "capstone"
}

variable "vnet_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "web_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "db_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}
