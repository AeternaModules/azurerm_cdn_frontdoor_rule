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
  # --- Unconfirmed validation candidates, derived from azurerm_cdn_frontdoor_rule's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.CdnFrontDoorRuleName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: cdn_frontdoor_rule_set_id
  #   source:    [from validate.FrontDoorRuleSetID] !ok
  # path: cdn_frontdoor_rule_set_id
  #   source:    [from validate.FrontDoorRuleSetID] err != nil
  # path: behavior_on_match
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: order
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: actions.url_redirect_action.redirect_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: actions.url_redirect_action.redirect_protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: actions.url_redirect_action.destination_path
  #   source:    validate.CdnFrontDoorUrlRedirectActionDestinationPath: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: actions.url_redirect_action.destination_hostname
  #   condition: length(value) >= 0 && length(value) <= 2048
  #   message:   must be between 0 and 2048 characters
  # path: actions.url_redirect_action.query_string
  #   source:    validate.CdnFrontDoorUrlRedirectActionQueryString: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: actions.url_redirect_action.destination_fragment
  #   condition: length(value) >= 0 && length(value) <= 1024
  #   message:   must be between 0 and 1024 characters
  # path: actions.url_rewrite_action.source_pattern
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: actions.url_rewrite_action.destination
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: actions.request_header_action.header_action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: actions.request_header_action.header_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: actions.request_header_action.value
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: actions.response_header_action.header_action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: actions.response_header_action.header_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: actions.response_header_action.value
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: actions.route_configuration_override_action.cdn_frontdoor_origin_group_id
  #   source:    [from validate.FrontDoorOriginGroupID] !ok
  # path: actions.route_configuration_override_action.cdn_frontdoor_origin_group_id
  #   source:    [from validate.FrontDoorOriginGroupID] err != nil
  # path: actions.route_configuration_override_action.forwarding_protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: actions.route_configuration_override_action.query_string_caching_behavior
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: actions.route_configuration_override_action.cache_behavior
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: actions.route_configuration_override_action.cache_duration
  #   source:    validate.CdnFrontDoorCacheDuration: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: conditions.remote_address_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.request_method_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.request_method_condition.match_values[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.query_string_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.query_string_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.post_args_condition.post_args_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: conditions.post_args_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.post_args_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.request_uri_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.request_uri_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.request_header_condition.header_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: conditions.request_header_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.request_header_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.request_body_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.request_body_condition.match_values[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: conditions.request_body_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.request_scheme_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.request_scheme_condition.match_values[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.url_path_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.url_path_condition.match_values[*]
  #   source:    validate.CdnFrontDoorUrlPathConditionMatchValue: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: conditions.url_path_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.url_file_extension_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.url_file_extension_condition.match_values[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: conditions.url_file_extension_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.url_filename_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.url_filename_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.http_version_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.http_version_condition.match_values[*]
  #   condition: contains(["2.0", "1.1", "1.0", "0.9"], value)
  #   message:   must be one of: 2.0, 1.1, 1.0, 0.9
  # path: conditions.cookies_condition.cookie_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: conditions.cookies_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.cookies_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.is_device_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.is_device_condition.match_values[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.socket_address_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.client_port_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.server_port_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.server_port_condition.match_values[*]
  #   condition: contains(["80", "443"], value)
  #   message:   must be one of: 80, 443
  # path: conditions.host_name_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.host_name_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.ssl_protocol_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conditions.ssl_protocol_condition.match_values[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

