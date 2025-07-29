# terraform-azurerm-utils

A Terraform module providing utility functions for Azure regions, inspired by [terraform-aws-utils](https://github.com/cloudposse/terraform-aws-utils).

## Usage

```hcl
module "azurerm_utils" {
  source = "github.com/proscia-techops/terraform-azurerm-utils"
}

locals {
  # Get the display name for a region
  region_name = module.azurerm_utils.to_display_name["eastus"]   # "East US"
  
  # Get the fixed (shortest) identifier for a region
  region_fixed = module.azurerm_utils.to_fixed["westus"]        # "wu1"
  
  # Get the short identifier for a region
  region_short = module.azurerm_utils.to_short["westeurope"]    # "weu1"
  
  # Convert back from an identifier to region code
  region_from_short = module.azurerm_utils.from_short["eus1"]   # "eastus"
  region_from_fixed = module.azurerm_utils.from_fixed["sc1"]    # "southcentralus"
}
```

## Examples

### Resource naming with region identifiers

```hcl
module "azurerm_utils" {
  source = "github.com/proscia-techops/terraform-azurerm-utils"
}

resource "azurerm_resource_group" {
  name     = "rg-app-${module.azurerm_utils.to_fixed[var.location]}"
  location = var.location
}
```

### Filtering resources by region

```hcl
module "azurerm_utils" {
  source = "github.com/proscia-techops/terraform-azurerm-utils"
}

data "azurerm_resources" "example" {
  resource_group_name = "example-resources"
}

locals {
  # Filter resources in a specific region
  eastus_resources = {
    for resource in data.azurerm_resources.example.resources :
    resource.name => resource
    if resource.location == module.azurerm_utils.from_short["eus1"]
  }
}
```

## Requirements

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
