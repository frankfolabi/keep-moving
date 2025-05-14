variable "table_name" {
  description = "The name of the DynamoDB table."
  type        = string
}

variable "billing_mode" {
  description = "Billing mode for the DynamoDB table (PAY_PER_REQUEST or PROVISIONED)."
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "username" {
  description = "The username is the hash key (primary key) for the DynamoDB table."
  type        = string
}

variable "email" {
  description = "The email attribute of the DynamoDB table."
  type        = string
}

variable "password" {
  description = "The password of the user hashed and stored."
  type        = string
}

variable "attribute_type" {
  description = "The type of the hash key attribute (e.g., 'S' for string, 'N' for number)."
  type        = string
  default     = "S"
}

variable "stream_enabled" {
  description = "DynamoDB Streams not enabled."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags for the DynamoDB table."
  type        = map(string)
  default     = {
    Name        = "flask_users_table"
    Environment = "dev"
  }
}

