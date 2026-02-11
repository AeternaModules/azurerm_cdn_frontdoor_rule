variable "cdn_frontdoor_rules" {
  description = <<EOT
Map of cdn_frontdoor_rules, attributes below
Required:
    - cdn_frontdoor_rule_set_id
    - name
    - order
    - actions (block):
        - request_header_action (optional, block):
            - header_action (required)
            - header_name (required)
            - value (optional)
        - response_header_action (optional, block):
            - header_action (required)
            - header_name (required)
            - value (optional)
        - route_configuration_override_action (optional, block):
            - cache_behavior (optional)
            - cache_duration (optional)
            - cdn_frontdoor_origin_group_id (optional)
            - compression_enabled (optional)
            - forwarding_protocol (optional)
            - query_string_caching_behavior (optional)
            - query_string_parameters (optional)
        - url_redirect_action (optional, block):
            - destination_fragment (optional)
            - destination_hostname (required)
            - destination_path (optional)
            - query_string (optional)
            - redirect_protocol (optional)
            - redirect_type (required)
        - url_rewrite_action (optional, block):
            - destination (required)
            - preserve_unmatched_path (optional)
            - source_pattern (required)
Optional:
    - behavior_on_match
    - conditions (block):
        - client_port_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
        - cookies_condition (optional, block):
            - cookie_name (required)
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - host_name_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - http_version_condition (optional, block):
            - match_values (required)
            - negate_condition (optional)
            - operator (optional)
        - is_device_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (optional)
        - post_args_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - post_args_name (required)
            - transforms (optional)
        - query_string_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - remote_address_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (optional)
        - request_body_condition (optional, block):
            - match_values (required)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - request_header_condition (optional, block):
            - header_name (required)
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - request_method_condition (optional, block):
            - match_values (required)
            - negate_condition (optional)
            - operator (optional)
        - request_scheme_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (optional)
        - request_uri_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - server_port_condition (optional, block):
            - match_values (required)
            - negate_condition (optional)
            - operator (required)
        - socket_address_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (optional)
        - ssl_protocol_condition (optional, block):
            - match_values (required)
            - negate_condition (optional)
            - operator (optional)
        - url_file_extension_condition (optional, block):
            - match_values (required)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - url_filename_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - url_path_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
EOT

  type = map(object({
    cdn_frontdoor_rule_set_id = string
    name                      = string
    order                     = number
    behavior_on_match         = optional(string) # Default: "Continue"
    actions = object({
      request_header_action = optional(object({
        header_action = string
        header_name   = string
        value         = optional(string)
      }))
      response_header_action = optional(object({
        header_action = string
        header_name   = string
        value         = optional(string)
      }))
      route_configuration_override_action = optional(object({
        cache_behavior                = optional(string)
        cache_duration                = optional(string)
        cdn_frontdoor_origin_group_id = optional(string)
        compression_enabled           = optional(bool)
        forwarding_protocol           = optional(string)
        query_string_caching_behavior = optional(string)
        query_string_parameters       = optional(list(string))
      }))
      url_redirect_action = optional(object({
        destination_fragment = optional(string) # Default: ""
        destination_hostname = string
        destination_path     = optional(string) # Default: ""
        query_string         = optional(string) # Default: ""
        redirect_protocol    = optional(string) # Default: "MatchRequest"
        redirect_type        = string
      }))
      url_rewrite_action = optional(object({
        destination             = string
        preserve_unmatched_path = optional(bool) # Default: false
        source_pattern          = string
      }))
    })
    conditions = optional(object({
      client_port_condition = optional(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
      }))
      cookies_condition = optional(object({
        cookie_name      = string
        match_values     = optional(list(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(set(string))
      }))
      host_name_condition = optional(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(set(string))
      }))
      http_version_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool)   # Default: false
        operator         = optional(string) # Default: "Equal"
      }))
      is_device_condition = optional(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)   # Default: false
        operator         = optional(string) # Default: "Equal"
      }))
      post_args_condition = optional(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        post_args_name   = string
        transforms       = optional(set(string))
      }))
      query_string_condition = optional(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(set(string))
      }))
      remote_address_condition = optional(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)   # Default: false
        operator         = optional(string) # Default: "IPMatch"
      }))
      request_body_condition = optional(object({
        match_values     = list(string)
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(set(string))
      }))
      request_header_condition = optional(object({
        header_name      = string
        match_values     = optional(list(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(set(string))
      }))
      request_method_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool)   # Default: false
        operator         = optional(string) # Default: "Equal"
      }))
      request_scheme_condition = optional(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)   # Default: false
        operator         = optional(string) # Default: "Equal"
      }))
      request_uri_condition = optional(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(set(string))
      }))
      server_port_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool) # Default: false
        operator         = string
      }))
      socket_address_condition = optional(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)   # Default: false
        operator         = optional(string) # Default: "IPMatch"
      }))
      ssl_protocol_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool)   # Default: false
        operator         = optional(string) # Default: "Equal"
      }))
      url_file_extension_condition = optional(object({
        match_values     = list(string)
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(set(string))
      }))
      url_filename_condition = optional(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(set(string))
      }))
      url_path_condition = optional(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(set(string))
      }))
    }))
  }))
}

