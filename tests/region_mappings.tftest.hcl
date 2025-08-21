run "setup" {
  command   = apply
  state_key = "main"
  module {
    source = "./.."
  }
}

run "api_to_display_assertions" {
  state_key = "main"
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
}

run "display_to_api_assertions" {
  state_key = "main"
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
}

run "api_to_fixed_assertions" {
  state_key = "main"
  # Test new regional prefix system
  assert {
    condition     = output.api_to_fixed["eastus"] == "ue1"
    error_message = "API to Fixed mapping for eastus should be ue1 (USA East 1)"
  }
  assert {
    condition     = output.api_to_fixed["westus"] == "uw2"
    error_message = "API to Fixed mapping for westus should be uw2 (USA West 2)"
  }
  assert {
    condition     = output.api_to_fixed["westeurope"] == "ew1"
    error_message = "API to Fixed mapping for westeurope should be ew1 (Europe West 1)"
  }
  assert {
    condition     = output.api_to_fixed["canadacentral"] == "cc1"
    error_message = "API to Fixed mapping for canadacentral should be cc1 (Canada Central 1)"
  }
  assert {
    condition     = output.api_to_fixed["australiaeast"] == "oe1"
    error_message = "API to Fixed mapping for australiaeast should be oe1 (Oceania East 1)"
  }
}

run "api_to_short_assertions" {
  state_key = "main"
  # Test new regional prefix system for short codes
  assert {
    condition     = output.api_to_short["eastus"] == "use1"
    error_message = "API to Short mapping for eastus should be use1 (USA East 1)"
  }
  assert {
    condition     = output.api_to_short["westus"] == "usw2"
    error_message = "API to Short mapping for westus should be usw2 (USA West 2)"
  }
  assert {
    condition     = output.api_to_short["westeurope"] == "euw1"
    error_message = "API to Short mapping for westeurope should be euw1 (Europe West 1)"
  }
  assert {
    condition     = output.api_to_short["canadacentral"] == "cac1"
    error_message = "API to Short mapping for canadacentral should be cac1 (Canada Central 1)"
  }
}

run "fixed_to_api_assertions" {
  state_key = "main"
  # Test reverse mappings from fixed codes
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
}

run "short_to_api_assertions" {
  state_key = "main"
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
  state_key = "main"
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
    condition     = output.fixed_to_display["ue1"] == "East US"
    error_message = "Fixed to Display mapping for ue1 should be 'East US'"
  }
  assert {
    condition     = output.short_to_display["use1"] == "East US"
    error_message = "Short to Display mapping for use1 should be 'East US'"
  }
}
