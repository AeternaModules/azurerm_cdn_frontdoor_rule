resource "azurerm_cdn_frontdoor_rule" "cdn_frontdoor_rules" {
  for_each = var.cdn_frontdoor_rules

  cdn_frontdoor_rule_set_id = each.value.cdn_frontdoor_rule_set_id
  name                      = each.value.name
  order                     = each.value.order
  behavior_on_match         = each.value.behavior_on_match

  actions {
    dynamic "request_header_action" {
      for_each = each.value.actions.request_header_action != null ? [each.value.actions.request_header_action] : []
      content {
        header_action = request_header_action.value.header_action
        header_name   = request_header_action.value.header_name
        value         = request_header_action.value.value
      }
    }
    dynamic "response_header_action" {
      for_each = each.value.actions.response_header_action != null ? [each.value.actions.response_header_action] : []
      content {
        header_action = response_header_action.value.header_action
        header_name   = response_header_action.value.header_name
        value         = response_header_action.value.value
      }
    }
    dynamic "route_configuration_override_action" {
      for_each = each.value.actions.route_configuration_override_action != null ? [each.value.actions.route_configuration_override_action] : []
      content {
        cache_behavior                = route_configuration_override_action.value.cache_behavior
        cache_duration                = route_configuration_override_action.value.cache_duration
        cdn_frontdoor_origin_group_id = route_configuration_override_action.value.cdn_frontdoor_origin_group_id
        compression_enabled           = route_configuration_override_action.value.compression_enabled
        forwarding_protocol           = route_configuration_override_action.value.forwarding_protocol
        query_string_caching_behavior = route_configuration_override_action.value.query_string_caching_behavior
        query_string_parameters       = route_configuration_override_action.value.query_string_parameters
      }
    }
    dynamic "url_redirect_action" {
      for_each = each.value.actions.url_redirect_action != null ? [each.value.actions.url_redirect_action] : []
      content {
        destination_fragment = url_redirect_action.value.destination_fragment
        destination_hostname = url_redirect_action.value.destination_hostname
        destination_path     = url_redirect_action.value.destination_path
        query_string         = url_redirect_action.value.query_string
        redirect_protocol    = url_redirect_action.value.redirect_protocol
        redirect_type        = url_redirect_action.value.redirect_type
      }
    }
    dynamic "url_rewrite_action" {
      for_each = each.value.actions.url_rewrite_action != null ? [each.value.actions.url_rewrite_action] : []
      content {
        destination             = url_rewrite_action.value.destination
        preserve_unmatched_path = url_rewrite_action.value.preserve_unmatched_path
        source_pattern          = url_rewrite_action.value.source_pattern
      }
    }
  }

  dynamic "conditions" {
    for_each = each.value.conditions != null ? [each.value.conditions] : []
    content {
      dynamic "client_port_condition" {
        for_each = conditions.value.client_port_condition != null ? [conditions.value.client_port_condition] : []
        content {
          match_values     = client_port_condition.value.match_values
          negate_condition = client_port_condition.value.negate_condition
          operator         = client_port_condition.value.operator
        }
      }
      dynamic "cookies_condition" {
        for_each = conditions.value.cookies_condition != null ? [conditions.value.cookies_condition] : []
        content {
          cookie_name      = cookies_condition.value.cookie_name
          match_values     = cookies_condition.value.match_values
          negate_condition = cookies_condition.value.negate_condition
          operator         = cookies_condition.value.operator
          transforms       = cookies_condition.value.transforms
        }
      }
      dynamic "host_name_condition" {
        for_each = conditions.value.host_name_condition != null ? [conditions.value.host_name_condition] : []
        content {
          match_values     = host_name_condition.value.match_values
          negate_condition = host_name_condition.value.negate_condition
          operator         = host_name_condition.value.operator
          transforms       = host_name_condition.value.transforms
        }
      }
      dynamic "http_version_condition" {
        for_each = conditions.value.http_version_condition != null ? [conditions.value.http_version_condition] : []
        content {
          match_values     = http_version_condition.value.match_values
          negate_condition = http_version_condition.value.negate_condition
          operator         = http_version_condition.value.operator
        }
      }
      dynamic "is_device_condition" {
        for_each = conditions.value.is_device_condition != null ? [conditions.value.is_device_condition] : []
        content {
          match_values     = is_device_condition.value.match_values
          negate_condition = is_device_condition.value.negate_condition
          operator         = is_device_condition.value.operator
        }
      }
      dynamic "post_args_condition" {
        for_each = conditions.value.post_args_condition != null ? [conditions.value.post_args_condition] : []
        content {
          match_values     = post_args_condition.value.match_values
          negate_condition = post_args_condition.value.negate_condition
          operator         = post_args_condition.value.operator
          post_args_name   = post_args_condition.value.post_args_name
          transforms       = post_args_condition.value.transforms
        }
      }
      dynamic "query_string_condition" {
        for_each = conditions.value.query_string_condition != null ? [conditions.value.query_string_condition] : []
        content {
          match_values     = query_string_condition.value.match_values
          negate_condition = query_string_condition.value.negate_condition
          operator         = query_string_condition.value.operator
          transforms       = query_string_condition.value.transforms
        }
      }
      dynamic "remote_address_condition" {
        for_each = conditions.value.remote_address_condition != null ? [conditions.value.remote_address_condition] : []
        content {
          match_values     = remote_address_condition.value.match_values
          negate_condition = remote_address_condition.value.negate_condition
          operator         = remote_address_condition.value.operator
        }
      }
      dynamic "request_body_condition" {
        for_each = conditions.value.request_body_condition != null ? [conditions.value.request_body_condition] : []
        content {
          match_values     = request_body_condition.value.match_values
          negate_condition = request_body_condition.value.negate_condition
          operator         = request_body_condition.value.operator
          transforms       = request_body_condition.value.transforms
        }
      }
      dynamic "request_header_condition" {
        for_each = conditions.value.request_header_condition != null ? [conditions.value.request_header_condition] : []
        content {
          header_name      = request_header_condition.value.header_name
          match_values     = request_header_condition.value.match_values
          negate_condition = request_header_condition.value.negate_condition
          operator         = request_header_condition.value.operator
          transforms       = request_header_condition.value.transforms
        }
      }
      dynamic "request_method_condition" {
        for_each = conditions.value.request_method_condition != null ? [conditions.value.request_method_condition] : []
        content {
          match_values     = request_method_condition.value.match_values
          negate_condition = request_method_condition.value.negate_condition
          operator         = request_method_condition.value.operator
        }
      }
      dynamic "request_scheme_condition" {
        for_each = conditions.value.request_scheme_condition != null ? [conditions.value.request_scheme_condition] : []
        content {
          match_values     = request_scheme_condition.value.match_values
          negate_condition = request_scheme_condition.value.negate_condition
          operator         = request_scheme_condition.value.operator
        }
      }
      dynamic "request_uri_condition" {
        for_each = conditions.value.request_uri_condition != null ? [conditions.value.request_uri_condition] : []
        content {
          match_values     = request_uri_condition.value.match_values
          negate_condition = request_uri_condition.value.negate_condition
          operator         = request_uri_condition.value.operator
          transforms       = request_uri_condition.value.transforms
        }
      }
      dynamic "server_port_condition" {
        for_each = conditions.value.server_port_condition != null ? [conditions.value.server_port_condition] : []
        content {
          match_values     = server_port_condition.value.match_values
          negate_condition = server_port_condition.value.negate_condition
          operator         = server_port_condition.value.operator
        }
      }
      dynamic "socket_address_condition" {
        for_each = conditions.value.socket_address_condition != null ? [conditions.value.socket_address_condition] : []
        content {
          match_values     = socket_address_condition.value.match_values
          negate_condition = socket_address_condition.value.negate_condition
          operator         = socket_address_condition.value.operator
        }
      }
      dynamic "ssl_protocol_condition" {
        for_each = conditions.value.ssl_protocol_condition != null ? [conditions.value.ssl_protocol_condition] : []
        content {
          match_values     = ssl_protocol_condition.value.match_values
          negate_condition = ssl_protocol_condition.value.negate_condition
          operator         = ssl_protocol_condition.value.operator
        }
      }
      dynamic "url_file_extension_condition" {
        for_each = conditions.value.url_file_extension_condition != null ? [conditions.value.url_file_extension_condition] : []
        content {
          match_values     = url_file_extension_condition.value.match_values
          negate_condition = url_file_extension_condition.value.negate_condition
          operator         = url_file_extension_condition.value.operator
          transforms       = url_file_extension_condition.value.transforms
        }
      }
      dynamic "url_filename_condition" {
        for_each = conditions.value.url_filename_condition != null ? [conditions.value.url_filename_condition] : []
        content {
          match_values     = url_filename_condition.value.match_values
          negate_condition = url_filename_condition.value.negate_condition
          operator         = url_filename_condition.value.operator
          transforms       = url_filename_condition.value.transforms
        }
      }
      dynamic "url_path_condition" {
        for_each = conditions.value.url_path_condition != null ? [conditions.value.url_path_condition] : []
        content {
          match_values     = url_path_condition.value.match_values
          negate_condition = url_path_condition.value.negate_condition
          operator         = url_path_condition.value.operator
          transforms       = url_path_condition.value.transforms
        }
      }
    }
  }
}

