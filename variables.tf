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
    behavior_on_match         = optional(string)
    actions = object({
      request_header_action = optional(list(object({
        header_action = string
        header_name   = string
        value         = optional(string)
      })))
      response_header_action = optional(list(object({
        header_action = string
        header_name   = string
        value         = optional(string)
      })))
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
        destination_fragment = optional(string)
        destination_hostname = string
        destination_path     = optional(string)
        query_string         = optional(string)
        redirect_protocol    = optional(string)
        redirect_type        = string
      }))
      url_rewrite_action = optional(object({
        destination             = string
        preserve_unmatched_path = optional(bool)
        source_pattern          = string
      }))
    })
    conditions = optional(object({
      client_port_condition = optional(list(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = string
      })))
      cookies_condition = optional(list(object({
        cookie_name      = string
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(set(string))
      })))
      host_name_condition = optional(list(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(set(string))
      })))
      http_version_condition = optional(list(object({
        match_values     = set(string)
        negate_condition = optional(bool)
        operator         = optional(string)
      })))
      is_device_condition = optional(list(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = optional(string)
      })))
      post_args_condition = optional(list(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = string
        post_args_name   = string
        transforms       = optional(set(string))
      })))
      query_string_condition = optional(list(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(set(string))
      })))
      remote_address_condition = optional(list(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = optional(string)
      })))
      request_body_condition = optional(list(object({
        match_values     = list(string)
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(set(string))
      })))
      request_header_condition = optional(list(object({
        header_name      = string
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(set(string))
      })))
      request_method_condition = optional(list(object({
        match_values     = set(string)
        negate_condition = optional(bool)
        operator         = optional(string)
      })))
      request_scheme_condition = optional(list(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = optional(string)
      })))
      request_uri_condition = optional(list(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(set(string))
      })))
      server_port_condition = optional(list(object({
        match_values     = set(string)
        negate_condition = optional(bool)
        operator         = string
      })))
      socket_address_condition = optional(list(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = optional(string)
      })))
      ssl_protocol_condition = optional(list(object({
        match_values     = set(string)
        negate_condition = optional(bool)
        operator         = optional(string)
      })))
      url_file_extension_condition = optional(list(object({
        match_values     = list(string)
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(set(string))
      })))
      url_filename_condition = optional(list(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(set(string))
      })))
      url_path_condition = optional(list(object({
        match_values     = optional(list(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(set(string))
      })))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.order >= 0
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.actions.url_redirect_action == null || (length(v.actions.url_redirect_action.destination_hostname) >= 0 && length(v.actions.url_redirect_action.destination_hostname) <= 2048)
      )
    ])
    error_message = "must be between 0 and 2048 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.actions.url_redirect_action == null || (v.actions.url_redirect_action.destination_fragment == null || (length(v.actions.url_redirect_action.destination_fragment) >= 0 && length(v.actions.url_redirect_action.destination_fragment) <= 1024))
      )
    ])
    error_message = "must be between 0 and 1024 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.actions.url_rewrite_action == null || (length(v.actions.url_rewrite_action.source_pattern) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.actions.url_rewrite_action == null || (length(v.actions.url_rewrite_action.destination) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.actions.request_header_action == null || alltrue([for item in v.actions.request_header_action : (length(item.header_name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.actions.request_header_action == null || alltrue([for item in v.actions.request_header_action : (item.value == null || (length(item.value) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.actions.response_header_action == null || alltrue([for item in v.actions.response_header_action : (length(item.header_name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.actions.response_header_action == null || alltrue([for item in v.actions.response_header_action : (item.value == null || (length(item.value) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.conditions == null || (v.conditions.post_args_condition == null || alltrue([for item in v.conditions.post_args_condition : (length(item.post_args_name) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.conditions == null || (v.conditions.request_header_condition == null || alltrue([for item in v.conditions.request_header_condition : (length(item.header_name) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.conditions == null || (v.conditions.request_body_condition == null || alltrue([for item in v.conditions.request_body_condition : (alltrue([for x in item.match_values : length(x) > 0]))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.conditions == null || (v.conditions.url_file_extension_condition == null || alltrue([for item in v.conditions.url_file_extension_condition : (alltrue([for x in item.match_values : length(x) > 0]))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.conditions == null || (v.conditions.http_version_condition == null || alltrue([for item in v.conditions.http_version_condition : (alltrue([for x in item.match_values : contains(["2.0", "1.1", "1.0", "0.9"], x)]))]))
      )
    ])
    error_message = "must be one of: 2.0, 1.1, 1.0, 0.9"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.conditions == null || (v.conditions.cookies_condition == null || alltrue([for item in v.conditions.cookies_condition : (length(item.cookie_name) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_rules : (
        v.conditions == null || (v.conditions.server_port_condition == null || alltrue([for item in v.conditions.server_port_condition : (alltrue([for x in item.match_values : contains(["80", "443"], x)]))]))
      )
    ])
    error_message = "must be one of: 80, 443"
  }
  # Note: 50 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

