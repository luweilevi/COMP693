variable "image_name" {
    description = "The name of the container image"
    type        = string
    default     = "web_app"
    }

variable "image_tag" {
    description = "The tag of the container image"
    type        = string
    default     = "latest"
    }