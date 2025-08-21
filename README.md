# terraform-azurerm-utils

A Terraform module providing comprehensive utility functions for Azure region mappings with standardized regional prefixes, inspired by [terraform-aws-utils](https://github.com/cloudposse/terraform-aws-utils).

## Regional Prefix System

This module implements a consistent regional prefix system for Azure regions:

- **USA**: `u` (fixed) or `us` (short)
- **Canada**: `c` (fixed) or `ca` (short) 
- **Europe**: `e` (fixed) or `eu` (short)
- **Asia**: `a` (fixed) or `as` (short)
- **South America**: `s` (fixed) or `sa` (short)
- **Africa**: `f` (fixed) or `af` (short)
- **Middle East/UAE**: `m` (fixed) or `me` (short)
- **Oceania**: `o` (fixed) or `oc` (short)

## Code Formats

- **Fixed codes**: 3 characters (e.g., `ue1` for East US)
- **Short codes**: 4 characters (e.g., `use1` for East US)
- **Display names**: Human-readable (e.g., `East US`)
- **API codes**: Azure region identifiers (e.g., `eastus`)

## Usage

```hcl
module "azurerm_utils" {
  source = "github.com/proscia-techops/terraform-azurerm-utils"
}

locals {
  # API to Display Name conversion
  region_name = module.azurerm_utils.api_to_display["eastus"]     # "East US"
  
  # API to Fixed identifier (3 chars)
  region_fixed = module.azurerm_utils.api_to_fixed["eastus"]     # "ue1"
  
  # API to Short identifier (4 chars)
  region_short = module.azurerm_utils.api_to_short["eastus"]     # "use1"
  
  # Display Name to API conversion
  api_code = module.azurerm_utils.display_to_api["East US"]      # "eastus"
  
  # Fixed/Short to API conversion
  api_from_fixed = module.azurerm_utils.fixed_to_api["ue1"]     # "eastus"
  api_from_short = module.azurerm_utils.short_to_api["use1"]    # "eastus"
  
  # Cross-format conversions
  fixed_from_display = module.azurerm_utils.display_to_fixed["East US"]  # "ue1"
  short_from_display = module.azurerm_utils.display_to_short["East US"]  # "use1"
}
```

## Available Outputs

The module provides 10 bidirectional mapping outputs:

- `api_to_display` / `display_to_api`
- `api_to_fixed` / `fixed_to_api` 
- `api_to_short` / `short_to_api`
- `display_to_fixed` / `fixed_to_display`
- `display_to_short` / `short_to_display`
- `regions` (complete list of available Azure regions)

## Examples

### Resource naming with region identifiers

```hcl
module "azurerm_utils" {
  source = "github.com/proscia-techops/terraform-azurerm-utils"
}

resource "azurerm_resource_group" {
  name     = "rg-app-${module.azurerm_utils.api_to_fixed[var.location]}"
  location = var.location
}

# Example: location = "eastus" → name = "rg-app-ue1"
```

### Multi-region deployment with consistent naming

```hcl
module "azurerm_utils" {
  source = "github.com/proscia-techops/terraform-azurerm-utils"
}

variable "regions" {
  default = ["eastus", "westus", "westeurope"]
}

resource "azurerm_storage_account" "example" {
  for_each = toset(var.regions)
  
  name                = "st${module.azurerm_utils.api_to_fixed[each.value]}"
  resource_group_name = azurerm_resource_group.example[each.key].name
  location           = each.value
  
  # Results in: stue1, stuw2, stew1
}
```

### Converting between formats for labels

```hcl
module "azurerm_utils" {
  source = "github.com/proscia-techops/terraform-azurerm-utils"
}

locals {
  primary_location_display = "East US"
  
  # Convert display name to API format for resource deployment
  primary_location_api = module.azurerm_utils.display_to_api[local.primary_location_display]
  
  # Convert to short code for environment labeling
  primary_location_short = module.azurerm_utils.display_to_short[local.primary_location_display]
}

module "label" {
  source = "cloudposse/label/null"
  
  environment = local.primary_location_short  # "use1"
  # Other label configuration...
}
```

## Requirements

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.11.0 |

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| api_to_display | API Style to Display Name mapping |
| api_to_fixed | API Style to Fixed mapping |
| api_to_short | API Style to Short mapping |
| display_to_api | Display Name to API Style mapping |
| display_to_fixed | Display Name to Fixed mapping |
| display_to_short | Display Name to Short mapping |
| fixed_to_api | Fixed to API Style mapping |
| fixed_to_display | Fixed to Display Name mapping |
| regions | Complete list of available Azure regions |
| short_to_api | Short to API Style mapping |
| short_to_display | Short to Display Name mapping |
<!-- END_TF_DOCS -->
