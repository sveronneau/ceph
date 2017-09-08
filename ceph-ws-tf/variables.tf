provider "cloudca" {
   api_key = "${var.api_key}"   
}

variable "api_key" {
   type="string"
}

variable "environment_id"{
   type="string"
}

variable "key_name"{
   type="string"
}

variable "node_count"{
   type="string"
}

variable "client_count"{
   type="string"
}

variable "network_id"{
   type="string"
}
