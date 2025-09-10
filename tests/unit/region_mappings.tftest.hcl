run "api_to_display_assertions" {
  command = plan

  assert {
    condition     = output.api_to_display["eastus"] == "East US"
    error_message = "API to Display mapping for eastus is incorrect"
  }
  assert {
    condition     = output.api_to_display["westus"] == "West US"
    error_message = "API to Display mapping for westus is incorrect"
  }
  assert {
    condition     = output.api_to_display["westeurope"] == "West Europe"
    error_message = "API to Display mapping for westeurope is incorrect"
  }
  assert {
    condition     = output.api_to_display["centralus"] == "Central US"
    error_message = "API to Display mapping for centralus is incorrect"
  }
  assert {
    condition     = output.api_to_display["northeurope"] == "North Europe"
    error_message = "API to Display mapping for northeurope is incorrect"
  }
}

run "display_to_api_assertions" {
  command = plan

  assert {
    condition     = output.display_to_api["East US"] == "eastus"
    error_message = "Display to API mapping for 'East US' is incorrect"
  }
  assert {
    condition     = output.display_to_api["West US"] == "westus"
    error_message = "Display to API mapping for 'West US' is incorrect"
  }
  assert {
    condition     = output.display_to_api["West Europe"] == "westeurope"
    error_message = "Display to API mapping for 'West Europe' is incorrect"
  }
  assert {
    condition     = output.display_to_api["Central US"] == "centralus"
    error_message = "Display to API mapping for 'Central US' is incorrect"
  }
  assert {
    condition     = output.display_to_api["North Europe"] == "northeurope"
    error_message = "Display to API mapping for 'North Europe' is incorrect"
  }
}

run "api_to_fixed_assertions" {
  command = plan

  # Test USA regions (u prefix)
  assert {
    condition     = output.api_to_fixed["eastus"] == "ue1"
    error_message = "API to Fixed mapping for eastus should be ue1 (USA East 1)"
  }
  assert {
    condition     = output.api_to_fixed["westus"] == "uw2"
    error_message = "API to Fixed mapping for westus should be uw2 (USA West 2)"
  }
  assert {
    condition     = output.api_to_fixed["centralus"] == "uc1"
    error_message = "API to Fixed mapping for centralus should be uc1 (USA Central 1)"
  }

  # Test Europe regions (e prefix)
  assert {
    condition     = output.api_to_fixed["westeurope"] == "ew1"
    error_message = "API to Fixed mapping for westeurope should be ew1 (Europe West 1)"
  }
  assert {
    condition     = output.api_to_fixed["northeurope"] == "en1"
    error_message = "API to Fixed mapping for northeurope should be en1 (Europe North 1)"
  }

  # Test Canada regions (c prefix)
  assert {
    condition     = output.api_to_fixed["canadacentral"] == "cc1"
    error_message = "API to Fixed mapping for canadacentral should be cc1 (Canada Central 1)"
  }

  # Test Asia regions (a prefix)
  assert {
    condition     = output.api_to_fixed["eastasia"] == "ae1"
    error_message = "API to Fixed mapping for eastasia should be ae1 (Asia East 1)"
  }
  assert {
    condition     = output.api_to_fixed["southeastasia"] == "as1"
    error_message = "API to Fixed mapping for southeastasia should be as1 (Asia Southeast 1)"
  }

  # Test Oceania regions (o prefix)
  assert {
    condition     = output.api_to_fixed["australiaeast"] == "oe1"
    error_message = "API to Fixed mapping for australiaeast should be oe1 (Oceania East 1)"
  }
}

run "api_to_short_assertions" {
  command = plan

  # Test USA regions
  assert {
    condition     = output.api_to_short["eastus"] == "use1"
    error_message = "API to Short mapping for eastus should be use1 (USA East 1)"
  }
  assert {
    condition     = output.api_to_short["westus"] == "usw2"
    error_message = "API to Short mapping for westus should be usw2 (USA West 2)"
  }
  assert {
    condition     = output.api_to_short["centralus"] == "usc1"
    error_message = "API to Short mapping for centralus should be usc1 (USA Central 1)"
  }

  # Test Europe regions
  assert {
    condition     = output.api_to_short["westeurope"] == "euw1"
    error_message = "API to Short mapping for westeurope should be euw1 (Europe West 1)"
  }
  assert {
    condition     = output.api_to_short["northeurope"] == "eun1"
    error_message = "API to Short mapping for northeurope should be eun1 (Europe North 1)"
  }

  # Test Canada regions
  assert {
    condition     = output.api_to_short["canadacentral"] == "cac1"
    error_message = "API to Short mapping for canadacentral should be cac1 (Canada Central 1)"
  }
}

run "reverse_mappings_assertions" {
  command = plan

  # Test Fixed to API mappings
  assert {
    condition     = output.fixed_to_api["ue1"] == "eastus"
    error_message = "Fixed to API mapping for ue1 is incorrect"
  }
  assert {
    condition     = output.fixed_to_api["uw2"] == "westus"
    error_message = "Fixed to API mapping for uw2 is incorrect"
  }
  assert {
    condition     = output.fixed_to_api["ew1"] == "westeurope"
    error_message = "Fixed to API mapping for ew1 is incorrect"
  }

  # Test Short to API mappings
  assert {
    condition     = output.short_to_api["use1"] == "eastus"
    error_message = "Short to API mapping for use1 is incorrect"
  }
  assert {
    condition     = output.short_to_api["usw2"] == "westus"
    error_message = "Short to API mapping for usw2 is incorrect"
  }
  assert {
    condition     = output.short_to_api["euw1"] == "westeurope"
    error_message = "Short to API mapping for euw1 is incorrect"
  }
}

run "display_mappings_assertions" {
  command = plan

  # Test Display Name to Fixed/Short mappings
  assert {
    condition     = output.display_to_fixed["East US"] == "ue1"
    error_message = "Display to Fixed mapping for 'East US' should be ue1"
  }
  assert {
    condition     = output.display_to_short["East US"] == "use1"
    error_message = "Display to Short mapping for 'East US' should be use1"
  }
  assert {
    condition     = output.display_to_fixed["West Europe"] == "ew1"
    error_message = "Display to Fixed mapping for 'West Europe' should be ew1"
  }
  assert {
    condition     = output.display_to_short["West Europe"] == "euw1"
    error_message = "Display to Short mapping for 'West Europe' should be euw1"
  }

  # Test Fixed/Short to Display mappings
  assert {
    condition     = output.fixed_to_display["ue1"] == "East US"
    error_message = "Fixed to Display mapping for ue1 should be 'East US'"
  }
  assert {
    condition     = output.short_to_display["use1"] == "East US"
    error_message = "Short to Display mapping for use1 should be 'East US'"
  }
  assert {
    condition     = output.fixed_to_display["ew1"] == "West Europe"
    error_message = "Fixed to Display mapping for ew1 should be 'West Europe'"
  }
  assert {
    condition     = output.short_to_display["euw1"] == "West Europe"
    error_message = "Short to Display mapping for euw1 should be 'West Europe'"
  }
}

run "regions_list_assertions" {
  command = plan

  # Test that regions list is populated and contains expected regions
  assert {
    condition     = length(output.regions) > 50
    error_message = "Regions list should contain more than 50 Azure regions"
  }
  assert {
    condition     = contains(output.regions, "eastus")
    error_message = "Regions list should contain 'eastus'"
  }
  assert {
    condition     = contains(output.regions, "westeurope")
    error_message = "Regions list should contain 'westeurope'"
  }
  assert {
    condition     = contains(output.regions, "canadacentral")
    error_message = "Regions list should contain 'canadacentral'"
  }
  assert {
    condition     = contains(output.regions, "eastasia")
    error_message = "Regions list should contain 'eastasia'"
  }
}

run "mapping_consistency_assertions" {
  command = plan

  # Test that forward and reverse mappings are consistent
  assert {
    condition     = output.display_to_api[output.api_to_display["eastus"]] == "eastus"
    error_message = "API to Display and Display to API mappings should be consistent for eastus"
  }
  assert {
    condition     = output.fixed_to_api[output.api_to_fixed["eastus"]] == "eastus"
    error_message = "API to Fixed and Fixed to API mappings should be consistent for eastus"
  }
  assert {
    condition     = output.short_to_api[output.api_to_short["eastus"]] == "eastus"
    error_message = "API to Short and Short to API mappings should be consistent for eastus"
  }

  # Test multi-hop consistency (API -> Display -> Fixed -> API)
  assert {
    condition     = output.fixed_to_api[output.display_to_fixed[output.api_to_display["westeurope"]]] == "westeurope"
    error_message = "Multi-hop mapping consistency failed for westeurope (API -> Display -> Fixed -> API)"
  }
}