variable "server_port" {
    description = "The port that the server will use to handle HTTP requests. "
    type = number
    default = 8080

    validation {
        condition = var.server_port >0 && var.server_port <65536
        error_message = "The port number much be between 1-65535"
      
    }
}