variable "name_prefix" {
  description = "Naam ka pehla hissa"
  type        = string
  default     = "tf"
}

variable "web_count" {
  description = "Kitne nginx containers chahiye"
  type        = number
  default     = 2
}

variable "base_port" {
  description = "Pehle container ka bahar ka port"
  type        = number
  default     = 8090
}
