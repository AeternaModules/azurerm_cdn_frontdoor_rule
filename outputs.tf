output "cdn_frontdoor_rules_actions" {
  description = "Map of actions values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.actions }
}
output "cdn_frontdoor_rules_behavior_on_match" {
  description = "Map of behavior_on_match values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.behavior_on_match }
}
output "cdn_frontdoor_rules_cdn_frontdoor_rule_set_id" {
  description = "Map of cdn_frontdoor_rule_set_id values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.cdn_frontdoor_rule_set_id }
}
output "cdn_frontdoor_rules_cdn_frontdoor_rule_set_name" {
  description = "Map of cdn_frontdoor_rule_set_name values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.cdn_frontdoor_rule_set_name }
}
output "cdn_frontdoor_rules_conditions" {
  description = "Map of conditions values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.conditions }
}
output "cdn_frontdoor_rules_name" {
  description = "Map of name values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.name }
}
output "cdn_frontdoor_rules_order" {
  description = "Map of order values across all cdn_frontdoor_rules, keyed the same as var.cdn_frontdoor_rules"
  value       = { for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : k => v.order }
}

