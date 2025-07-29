output "to_display_name" {
  description = "Map of Azure region codes to their display names"
  value       = local.to_display_name
}

output "to_fixed" {
  description = "Map of Azure region codes to shortest possible identifiers"
  value       = local.to_fixed
}

output "to_short" {
  description = "Map of Azure region codes to short identifiers (slightly more descriptive than fixed)"
  value       = local.to_short
}

output "from_fixed" {
  description = "Map of fixed identifiers back to Azure region codes"
  value       = local.from_fixed
}

output "from_short" {
  description = "Map of short identifiers back to Azure region codes"
  value       = local.from_short
}

output "regions" {
  description = "Complete list of available Azure regions"
  value       = local.regions
}