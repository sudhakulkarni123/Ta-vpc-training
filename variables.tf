variable "vpc_name" {
    description = "This is the vpc name"
    type = string
}

variable "vpc_cidr" {
    description = "This is cidr for vpc"
}

variable "cidr_public" {
    description = "This is cidr for public"
}

variable "cidr_private" {
    description = "This is cidr for private"
}

variable "cidr_data" {
    description = "This is cidr for data"
}
