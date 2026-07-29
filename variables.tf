variable "cdn_frontdoor_rules" {
  description = <<EOT
Map of cdn_frontdoor_rules, attributes below
Required:
    - cdn_frontdoor_rule_set_id
    - name
    - order
    - actions (block):
        - modify_request_header (optional, block):
            - header_name (required)
            - header_value (optional)
            - operator (required)
        - modify_response_header (optional, block):
            - header_name (required)
            - header_value (optional)
            - operator (required)
        - route_configuration_override (optional, block):
            - caching (required, block):
                - behaviour (required)
                - compression_enabled (optional)
                - duration (optional)
                - query_string_behaviour (optional)
                - query_string_parameters (optional)
            - origin_group (optional, block):
                - cdn_frontdoor_origin_group_id (required)
                - forwarding_protocol (required)
        - url_redirect (optional, block):
            - destination_fragment (optional)
            - destination_host_name (optional)
            - destination_path (optional)
            - query_string (optional)
            - redirect_protocol (optional)
            - redirect_type (required)
        - url_rewrite (optional, block):
            - destination_path (required)
            - preserve_unmatched_path_enabled (optional)
            - source_pattern (required)
Optional:
    - behaviour_on_match
    - conditions (block):
        - client_port (optional, block):
            - operator (required)
            - values (optional)
        - device_type (optional, block):
            - operator (required)
            - values (required)
        - host_name (optional, block):
            - operator (required)
            - transforms (optional)
            - values (optional)
        - http_version (optional, block):
            - operator (required)
            - values (required)
        - post_argument (optional, block):
            - name (required)
            - operator (required)
            - transforms (optional)
            - values (optional)
        - query_string (optional, block):
            - operator (required)
            - transforms (optional)
            - values (optional)
        - remote_address (optional, block):
            - operator (required)
            - values (required)
        - request_body (optional, block):
            - operator (required)
            - transforms (optional)
            - values (optional)
        - request_cookies (optional, block):
            - name (required)
            - operator (required)
            - transforms (optional)
            - values (optional)
        - request_file_extension (optional, block):
            - operator (required)
            - transforms (optional)
            - values (optional)
        - request_filename (optional, block):
            - operator (required)
            - transforms (optional)
            - values (optional)
        - request_header (optional, block):
            - name (required)
            - operator (required)
            - transforms (optional)
            - values (optional)
        - request_method (optional, block):
            - operator (required)
            - values (required)
        - request_path (optional, block):
            - operator (required)
            - transforms (optional)
            - values (optional)
        - request_scheme (optional, block):
            - operator (required)
            - values (required)
        - request_url (optional, block):
            - operator (required)
            - transforms (optional)
            - values (optional)
        - server_port (optional, block):
            - operator (required)
            - values (optional)
        - socket_address (optional, block):
            - operator (required)
            - values (required)
        - ssl_protocol (optional, block):
            - operator (required)
            - values (required)
EOT

  type = map(object({
    cdn_frontdoor_rule_set_id = string
    name                      = string
    order                     = number
    behaviour_on_match        = optional(string)
    actions = object({
      modify_request_header = optional(list(object({
        header_name  = string
        header_value = optional(string)
        operator     = string
      })))
      modify_response_header = optional(list(object({
        header_name  = string
        header_value = optional(string)
        operator     = string
      })))
      route_configuration_override = optional(object({
        caching = object({
          behaviour               = string
          compression_enabled     = optional(bool)
          duration                = optional(string)
          query_string_behaviour  = optional(string)
          query_string_parameters = optional(list(string))
        })
        origin_group = optional(object({
          cdn_frontdoor_origin_group_id = string
          forwarding_protocol           = string
        }))
      }))
      url_redirect = optional(object({
        destination_fragment  = optional(string)
        destination_host_name = optional(string)
        destination_path      = optional(string)
        query_string          = optional(string)
        redirect_protocol     = optional(string)
        redirect_type         = string
      }))
      url_rewrite = optional(object({
        destination_path                = string
        preserve_unmatched_path_enabled = optional(bool)
        source_pattern                  = string
      }))
    })
    conditions = optional(object({
      client_port = optional(list(object({
        operator = string
        values   = optional(list(string))
      })))
      device_type = optional(list(object({
        operator = string
        values   = list(string)
      })))
      host_name = optional(list(object({
        operator   = string
        transforms = optional(set(string))
        values     = optional(list(string))
      })))
      http_version = optional(list(object({
        operator = string
        values   = set(string)
      })))
      post_argument = optional(list(object({
        name       = string
        operator   = string
        transforms = optional(set(string))
        values     = optional(list(string))
      })))
      query_string = optional(list(object({
        operator   = string
        transforms = optional(set(string))
        values     = optional(list(string))
      })))
      remote_address = optional(list(object({
        operator = string
        values   = list(string)
      })))
      request_body = optional(list(object({
        operator   = string
        transforms = optional(set(string))
        values     = optional(list(string))
      })))
      request_cookies = optional(list(object({
        name       = string
        operator   = string
        transforms = optional(set(string))
        values     = optional(list(string))
      })))
      request_file_extension = optional(list(object({
        operator   = string
        transforms = optional(set(string))
        values     = optional(list(string))
      })))
      request_filename = optional(list(object({
        operator   = string
        transforms = optional(set(string))
        values     = optional(list(string))
      })))
      request_header = optional(list(object({
        name       = string
        operator   = string
        transforms = optional(set(string))
        values     = optional(list(string))
      })))
      request_method = optional(list(object({
        operator = string
        values   = set(string)
      })))
      request_path = optional(list(object({
        operator   = string
        transforms = optional(set(string))
        values     = optional(list(string))
      })))
      request_scheme = optional(list(object({
        operator = string
        values   = list(string)
      })))
      request_url = optional(list(object({
        operator   = string
        transforms = optional(set(string))
        values     = optional(list(string))
      })))
      server_port = optional(list(object({
        operator = string
        values   = optional(set(string))
      })))
      socket_address = optional(list(object({
        operator = string
        values   = list(string)
      })))
      ssl_protocol = optional(list(object({
        operator = string
        values   = set(string)
      })))
    }))
  }))
}

