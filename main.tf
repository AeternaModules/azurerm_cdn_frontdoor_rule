resource "azurerm_cdn_frontdoor_rule" "cdn_frontdoor_rules" {
  for_each = var.cdn_frontdoor_rules

  cdn_frontdoor_rule_set_id = each.value.cdn_frontdoor_rule_set_id
  name                      = each.value.name
  order                     = each.value.order
  behaviour_on_match        = each.value.behaviour_on_match

  actions {
    dynamic "modify_request_header" {
      for_each = each.value.actions.modify_request_header != null ? each.value.actions.modify_request_header : []
      content {
        header_name  = modify_request_header.value.header_name
        header_value = modify_request_header.value.header_value
        operator     = modify_request_header.value.operator
      }
    }
    dynamic "modify_response_header" {
      for_each = each.value.actions.modify_response_header != null ? each.value.actions.modify_response_header : []
      content {
        header_name  = modify_response_header.value.header_name
        header_value = modify_response_header.value.header_value
        operator     = modify_response_header.value.operator
      }
    }
    dynamic "route_configuration_override" {
      for_each = each.value.actions.route_configuration_override != null ? [each.value.actions.route_configuration_override] : []
      content {
        caching {
          behaviour               = route_configuration_override.value.caching.behaviour
          compression_enabled     = route_configuration_override.value.caching.compression_enabled
          duration                = route_configuration_override.value.caching.duration
          query_string_behaviour  = route_configuration_override.value.caching.query_string_behaviour
          query_string_parameters = route_configuration_override.value.caching.query_string_parameters
        }
        dynamic "origin_group" {
          for_each = route_configuration_override.value.origin_group != null ? [route_configuration_override.value.origin_group] : []
          content {
            cdn_frontdoor_origin_group_id = origin_group.value.cdn_frontdoor_origin_group_id
            forwarding_protocol           = origin_group.value.forwarding_protocol
          }
        }
      }
    }
    dynamic "url_redirect" {
      for_each = each.value.actions.url_redirect != null ? [each.value.actions.url_redirect] : []
      content {
        destination_fragment  = url_redirect.value.destination_fragment
        destination_host_name = url_redirect.value.destination_host_name
        destination_path      = url_redirect.value.destination_path
        query_string          = url_redirect.value.query_string
        redirect_protocol     = url_redirect.value.redirect_protocol
        redirect_type         = url_redirect.value.redirect_type
      }
    }
    dynamic "url_rewrite" {
      for_each = each.value.actions.url_rewrite != null ? [each.value.actions.url_rewrite] : []
      content {
        destination_path                = url_rewrite.value.destination_path
        preserve_unmatched_path_enabled = url_rewrite.value.preserve_unmatched_path_enabled
        source_pattern                  = url_rewrite.value.source_pattern
      }
    }
  }

  dynamic "conditions" {
    for_each = each.value.conditions != null ? [each.value.conditions] : []
    content {
      dynamic "client_port" {
        for_each = conditions.value.client_port != null ? conditions.value.client_port : []
        content {
          operator = client_port.value.operator
          values   = client_port.value.values
        }
      }
      dynamic "device_type" {
        for_each = conditions.value.device_type != null ? conditions.value.device_type : []
        content {
          operator = device_type.value.operator
          values   = device_type.value.values
        }
      }
      dynamic "host_name" {
        for_each = conditions.value.host_name != null ? conditions.value.host_name : []
        content {
          operator   = host_name.value.operator
          transforms = host_name.value.transforms
          values     = host_name.value.values
        }
      }
      dynamic "http_version" {
        for_each = conditions.value.http_version != null ? conditions.value.http_version : []
        content {
          operator = http_version.value.operator
          values   = http_version.value.values
        }
      }
      dynamic "post_argument" {
        for_each = conditions.value.post_argument != null ? conditions.value.post_argument : []
        content {
          name       = post_argument.value.name
          operator   = post_argument.value.operator
          transforms = post_argument.value.transforms
          values     = post_argument.value.values
        }
      }
      dynamic "query_string" {
        for_each = conditions.value.query_string != null ? conditions.value.query_string : []
        content {
          operator   = query_string.value.operator
          transforms = query_string.value.transforms
          values     = query_string.value.values
        }
      }
      dynamic "remote_address" {
        for_each = conditions.value.remote_address != null ? conditions.value.remote_address : []
        content {
          operator = remote_address.value.operator
          values   = remote_address.value.values
        }
      }
      dynamic "request_body" {
        for_each = conditions.value.request_body != null ? conditions.value.request_body : []
        content {
          operator   = request_body.value.operator
          transforms = request_body.value.transforms
          values     = request_body.value.values
        }
      }
      dynamic "request_cookies" {
        for_each = conditions.value.request_cookies != null ? conditions.value.request_cookies : []
        content {
          name       = request_cookies.value.name
          operator   = request_cookies.value.operator
          transforms = request_cookies.value.transforms
          values     = request_cookies.value.values
        }
      }
      dynamic "request_file_extension" {
        for_each = conditions.value.request_file_extension != null ? conditions.value.request_file_extension : []
        content {
          operator   = request_file_extension.value.operator
          transforms = request_file_extension.value.transforms
          values     = request_file_extension.value.values
        }
      }
      dynamic "request_filename" {
        for_each = conditions.value.request_filename != null ? conditions.value.request_filename : []
        content {
          operator   = request_filename.value.operator
          transforms = request_filename.value.transforms
          values     = request_filename.value.values
        }
      }
      dynamic "request_header" {
        for_each = conditions.value.request_header != null ? conditions.value.request_header : []
        content {
          name       = request_header.value.name
          operator   = request_header.value.operator
          transforms = request_header.value.transforms
          values     = request_header.value.values
        }
      }
      dynamic "request_method" {
        for_each = conditions.value.request_method != null ? conditions.value.request_method : []
        content {
          operator = request_method.value.operator
          values   = request_method.value.values
        }
      }
      dynamic "request_path" {
        for_each = conditions.value.request_path != null ? conditions.value.request_path : []
        content {
          operator   = request_path.value.operator
          transforms = request_path.value.transforms
          values     = request_path.value.values
        }
      }
      dynamic "request_scheme" {
        for_each = conditions.value.request_scheme != null ? conditions.value.request_scheme : []
        content {
          operator = request_scheme.value.operator
          values   = request_scheme.value.values
        }
      }
      dynamic "request_url" {
        for_each = conditions.value.request_url != null ? conditions.value.request_url : []
        content {
          operator   = request_url.value.operator
          transforms = request_url.value.transforms
          values     = request_url.value.values
        }
      }
      dynamic "server_port" {
        for_each = conditions.value.server_port != null ? conditions.value.server_port : []
        content {
          operator = server_port.value.operator
          values   = server_port.value.values
        }
      }
      dynamic "socket_address" {
        for_each = conditions.value.socket_address != null ? conditions.value.socket_address : []
        content {
          operator = socket_address.value.operator
          values   = socket_address.value.values
        }
      }
      dynamic "ssl_protocol" {
        for_each = conditions.value.ssl_protocol != null ? conditions.value.ssl_protocol : []
        content {
          operator = ssl_protocol.value.operator
          values   = ssl_protocol.value.values
        }
      }
    }
  }
}

