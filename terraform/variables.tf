variable "yc_cloud" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "yc_key_file" {
  type        = string
  description = "Yandex Cloud Key file"
}


variable "yc_folder" {
  type        = string
  description = "Yandex Cloud folder"
}

variable "yc_token" {
  type        = string
  description = "Yandex Cloud OAuth token"
}

variable "db_user" {
  description = "Postgresql username"
}

variable "db_password" {
  description = "PostgreSQL pasword"
}

variable "instances" {
  type = map(any)
}

variable "username" {
  type        = string
  description = "System username"
}

variable "path_to_ssh_pub_key" {
  type        = string
  description = "Path to public key file"
}

variable "path_to_ssh_priv_key" {
  type        = string
  description = "Path to private key file"
}
