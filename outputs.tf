output "cdn_frontdoor_rules_id" {
  description = "Map of id values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cdn_frontdoor_rules_actions" {
  description = "Map of actions values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => one(v.actions) if v.actions != null && length(v.actions) > 0 }
}
output "cdn_frontdoor_rules_behavior_on_match" {
  description = "Map of behavior_on_match values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.behavior_on_match if v.behavior_on_match != null && length(v.behavior_on_match) > 0 }
}
output "cdn_frontdoor_rules_cdn_frontdoor_rule_set_id" {
  description = "Map of cdn_frontdoor_rule_set_id values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.cdn_frontdoor_rule_set_id if v.cdn_frontdoor_rule_set_id != null && length(v.cdn_frontdoor_rule_set_id) > 0 }
}
output "cdn_frontdoor_rules_cdn_frontdoor_rule_set_name" {
  description = "Map of cdn_frontdoor_rule_set_name values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.cdn_frontdoor_rule_set_name if v.cdn_frontdoor_rule_set_name != null && length(v.cdn_frontdoor_rule_set_name) > 0 }
}
output "cdn_frontdoor_rules_conditions" {
  description = "Map of conditions values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => one(v.conditions) if v.conditions != null && length(v.conditions) > 0 }
}
output "cdn_frontdoor_rules_name" {
  description = "Map of name values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.name if v.name != null && length(v.name) > 0 }
}
output "cdn_frontdoor_rules_order" {
  description = "Map of order values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.order if v.order != null }
}

