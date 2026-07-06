output "cdn_frontdoor_rules" {
  description = "All cdn_frontdoor_rule resources"
  value       = azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules
}
output "cdn_frontdoor_rules_actions" {
  description = "List of actions values across all cdn_frontdoor_rules"
  value       = [for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : v.actions]
}
output "cdn_frontdoor_rules_behavior_on_match" {
  description = "List of behavior_on_match values across all cdn_frontdoor_rules"
  value       = [for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : v.behavior_on_match]
}
output "cdn_frontdoor_rules_cdn_frontdoor_rule_set_id" {
  description = "List of cdn_frontdoor_rule_set_id values across all cdn_frontdoor_rules"
  value       = [for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : v.cdn_frontdoor_rule_set_id]
}
output "cdn_frontdoor_rules_cdn_frontdoor_rule_set_name" {
  description = "List of cdn_frontdoor_rule_set_name values across all cdn_frontdoor_rules"
  value       = [for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : v.cdn_frontdoor_rule_set_name]
}
output "cdn_frontdoor_rules_conditions" {
  description = "List of conditions values across all cdn_frontdoor_rules"
  value       = [for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : v.conditions]
}
output "cdn_frontdoor_rules_name" {
  description = "List of name values across all cdn_frontdoor_rules"
  value       = [for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : v.name]
}
output "cdn_frontdoor_rules_order" {
  description = "List of order values across all cdn_frontdoor_rules"
  value       = [for k, v in azurerm_cdn_frontdoor_rule.cdn_frontdoor_rules : v.order]
}

